unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  XMLPropStorage, EditBtn, Grids, TAGraph, TAIntervalSources, TASeries,
  TASources, u_LinSolDat, dateutils;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button_inTabelle: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart1LineSeries2: TLineSeries;
    Chart1LineSeries3: TLineSeries;
    CheckBox_aktDaten: TCheckBox;
    CheckBox_Betriebsmodus: TCheckBox;
    CheckBox_FW: TCheckBox;
    CheckBox_Modulmodus: TCheckBox;
    CheckBox_ModulTyp: TCheckBox;
    DateEdit_Ende: TDateEdit;
    DateEdit_Start: TDateEdit;
    DateTimeIntervalChartSource1: TDateTimeIntervalChartSource;
    Edit_Verzeichnis: TEdit;
    Edit_IPAdresse: TEdit;
    Edit_Port: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ListChartSource1: TListChartSource;
    ListChartSource2: TListChartSource;
    ListChartSource3: TListChartSource;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    XMLPropStorage1: TXMLPropStorage;
    procedure TabellenKopf();
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button_inTabelleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure XMLPropStorage1RestoreProperties(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 
  SolDat : TSolDat;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  i       : Integer;
  test3   : TDateTime;
begin
  test3:=Now;
  if Button1.Tag = 0 then
    Button1.Tag:=1
  else
  Button1.Tag:=0;

  Memo1.Clear;
  SolDat.BLNetIPAdresse:=Edit_IPAdresse.Text;
  SolDat.BLNetPort:=StrToInt(Edit_Port.Text);
  if CheckBox_FW.Checked then begin
    Memo1.Append('Firmware: '+SolDat.Firmware);
  end;
  if CheckBox_Betriebsmodus.Checked then
    Memo1.Append('Betriebsmodus: '+SolDat.BetriebsModus);

  if CheckBox_Modulmodus.Checked then begin
    Memo1.Append('ModulModus: '+SolDat.ModulModus);
  end;

  if CheckBox_ModulTyp.Checked then begin
    Memo1.Append('ModulTyp: '+SolDat.ModulTyp);
  end;

  if CheckBox_aktDaten.Checked then begin
    if SolDat.AktuelleDatenLesen then begin
       for i:=0 to 15 do
           Memo1.Append('Sensor '+IntToStr(i+1)+': '+
              FormatFloat('###,###.##',SolDat.AktuelleDatenRecord[0].Sensoren[i]));
       Memo1.Append('dza1_stufe: '+IntToStr(SolDat.AktuelleDatenRecord[0].dza1_stufe));
       Memo1.Append('dza2_stufe: '+IntToStr(SolDat.AktuelleDatenRecord[0].dza2_stufe));
       Memo1.Append('dza6_stufe: '+IntToStr(SolDat.AktuelleDatenRecord[0].dza6_stufe));
       Memo1.Append('dza7_stufe: '+IntToStr(SolDat.AktuelleDatenRecord[0].dza7_stufe));
       for i:=0 to 12 do begin
            if SolDat.AktuelleDatenRecord[0].Ausgaenge[i] then
              Memo1.Append('Ausgang '+IntToStr(i+1)+': EIN')
            else
              Memo1.Append('Ausgang '+IntToStr(i+1)+': AUS');
       end;
       Memo1.Append(DateTimeToStr(SolDat.AktuelleDatenRecord[0].RDateTime));
    end;
  end;

//  Memo1.Append(IntToStr(Button1.Tag));
//  Memo1.Append(SolDat.BLNetIPAdresse);
//  Memo1.Append(IntToStr(SolDat.BLNetPort));

  if SecondsBetween(Now,test3) > 3 then
    Memo1.Append(TimeToStr(Now-test3));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Append(SolDat.LogDatenDir);
  Memo1.Append(Edit_Verzeichnis.Text);
  SolDat.LogDatenDir := Edit_Verzeichnis.Text;
  Memo1.Append(SolDat.LogDatenDir);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i       : Integer;
  anzahl  : Integer;
begin
  Memo1.Clear;
  //Memo1.Append(DateEdit_Start.Text);
  //Memo1.Append(DateEdit_Ende.Text);
  if SolDat.SolDat[DateEdit_Start.Date,DateEdit_Ende.Date] then begin
    //Memo1.Append(IntToStr(Length(SolDat.SolDatRecArray)));
    //Memo1.Append(FormatFloat('###,###.##',SolDat.SolDatRecArray[1].Sensoren[14]));
    anzahl:=Length(SolDat.SolDatRecArray);
    for i:=0 to anzahl-1 do
      Memo1.Append(DateTimeToStr(SolDat.SolDatRecArray[i].RDateTime));
  end
  else
    Memo1.Append('Daten lesen mit FALSE beendet.');
end;

procedure TForm1.Button_inTabelleClick(Sender: TObject);
var
  i, j, k  : Integer;
  Ausgang  : TAusgang;
  dt       : TDateTime;
  anzahl  : Integer;
begin
  if NOT SolDat.SolDat[DateEdit_Start.Date,DateEdit_Ende.Date] then
    exit;

  // LineChart:
  ListChartSource1.Clear;
  ListChartSource2.Clear;
  Chart1LineSeries1.SeriesColor:=clRed;
  Chart1LineSeries2.SeriesColor:=clBlue;

  anzahl:=Length(SolDat.SolDatRecArray);
  dt := now;
  StringGrid1.Clean;
  StringGrid1.RowCount:=anzahl+1;
  TabellenKopf();
  for i:=0 to anzahl-1 do begin
    j:=0;
    StringGrid1.Cells[j,i+1]:= IntToStr(YearOf(SolDat.SolDatRecArray[i].RDateTime));
    j:=j+1;
    StringGrid1.Cells[j,i+1]:=IntToStr(MonthOf(SolDat.SolDatRecArray[i].RDateTime));
    j:=j+1;
    StringGrid1.Cells[j,i+1]:=IntToStr(DayOf(SolDat.SolDatRecArray[i].RDateTime));
    j:=j+1;
    StringGrid1.Cells[j,i+1]:=IntToStr(HourOf(SolDat.SolDatRecArray[i].RDateTime));
    j:=j+1;
    StringGrid1.Cells[j,i+1]:=IntToStr(MinuteOf(SolDat.SolDatRecArray[i].RDateTime));
    j:=j+1;
    StringGrid1.Cells[j,i+1]:=IntToStr(SecondOf(SolDat.SolDatRecArray[i].RDateTime));
    j:=j+1;
    for k:=0 to 12 do begin
      if SolDat.SolDatRecArray[i].Ausgaenge[k] then begin
         StringGrid1.Cells[j,i+1]:='1';
      end
      else begin
         StringGrid1.Cells[j,i+1]:='0';
      end;
      j:=j+1;
    end;
    ListChartSource2.Add(SolDat.SolDatRecArray[i].RDateTime,StrToInt(StringGrid1.Cells[j-10,i+1]));
    StringGrid1.Cells[j,i+1]:=IntToStr(SolDat.SolDatRecArray[i].dza1_stufe);
    j:=j+1;
    StringGrid1.Cells[j,i+1]:=IntToStr(SolDat.SolDatRecArray[i].dza2_stufe);
    j:=j+1;
    StringGrid1.Cells[j,i+1]:=IntToStr(SolDat.SolDatRecArray[i].dza6_stufe);
    j:=j+1;
    StringGrid1.Cells[j,i+1]:=IntToStr(SolDat.SolDatRecArray[i].dza7_stufe);
    j:=j+1;
    // LineChart:
    ListChartSource1.Add(SolDat.SolDatRecArray[i].RDateTime,SolDat.SolDatRecArray[i].Sensoren[0]);
//    ListChartSource2.Add(SolDat.SolDatRecArray[i].RDateTime,SolDat.SolDatRecArray[i].Sensoren[1]);

    for k:=0 to 15 do begin
      StringGrid1.Cells[j,i+1]:=FormatFloat('###,##0.##',SolDat.SolDatRecArray[i].Sensoren[k]);
      j:=j+1;
    end;
    if (SolDat.SolDatRecArray[i].Wmz1_aktiv) and (SolDat.SolDatRecArray[i].Wmz2_aktiv) then
       StringGrid1.Cells[j,i+1]:='3'
    else begin
       if (SolDat.SolDatRecArray[i].Wmz1_aktiv) then
       StringGrid1.Cells[j,i+1]:='1'
       else if (SolDat.SolDatRecArray[i].Wmz2_aktiv) then
         StringGrid1.Cells[j,i+1]:='2';
    end;
    j:=j+1;
    if (SolDat.SolDatRecArray[i].Wmz1_aktiv) then begin
       StringGrid1.Cells[j,i+1]:=FormatFloat('###,##0.##',SolDat.SolDatRecArray[i].Lstg1);
       j:=j+1;
       StringGrid1.Cells[j,i+1]:=FormatFloat('###,##0.##',SolDat.SolDatRecArray[i].Kwh1);
       j:=j+1;
       StringGrid1.Cells[j,i+1]:=FormatFloat('###,##0.##',SolDat.SolDatRecArray[i].mwh1);
       j:=j+1;
    end
    else begin
       StringGrid1.Cells[j,i+1]:='0';
       j:=j+1;
       StringGrid1.Cells[j,i+1]:='0';
       j:=j+1;
       StringGrid1.Cells[j,i+1]:='0';
       j:=j+1;
    end;
    if (SolDat.SolDatRecArray[i].Wmz2_aktiv) then begin
       StringGrid1.Cells[j,i+1]:=FormatFloat('###,##0.##',SolDat.SolDatRecArray[i].Lstg2);
       j:=j+1;
       StringGrid1.Cells[j,i+1]:=FormatFloat('###,##0.##',SolDat.SolDatRecArray[i].Kwh2);
       j:=j+1;
       StringGrid1.Cells[j,i+1]:=FormatFloat('###,##0.##',SolDat.SolDatRecArray[i].mwh2);
    end
    else begin
       StringGrid1.Cells[j,i+1]:='0';
       j:=j+1;
       StringGrid1.Cells[j,i+1]:='0';
       j:=j+1;
       StringGrid1.Cells[j,i+1]:='0';
    end;
  end;
  StringGrid1.AutoSizeColumns;
  Memo1.Append(IntToStr(j));
  // LineChart:
  Chart1LineSeries1.Active:=True;
  Chart1LineSeries2.Active:=True;
//  Chart1.AddSeries(s);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SolDat:=TSolDat.Create;
end;

procedure TForm1.TabellenKopf();
var
  i, j    : Integer;
begin
  i :=0;
  StringGrid1.Cells[i,0]:='Jahr';
  i:=i+1;
  StringGrid1.Cells[i,0]:='Monat';
  i:=i+1;
  StringGrid1.Cells[i,0]:='Tag';
  i:=i+1;
  StringGrid1.Cells[i,0]:='Stunde';
  i:=i+1;
  StringGrid1.Cells[i,0]:='Minute';
  i:=i+1;
  StringGrid1.Cells[i,0]:='Sekunde';
  for j:=1 to 13 do begin
    i:=i+1;
    StringGrid1.Cells[i,0]:='A'+IntToStr(j);
  end;
  i:=i+1;
  StringGrid1.Cells[i,0]:='Drehzahlstufe 1';
  i:=i+1;
  StringGrid1.Cells[i,0]:='Drehzahlstufe 2';
  i:=i+1;
  StringGrid1.Cells[i,0]:='Drehzahlstufe 6';
  i:=i+1;
  StringGrid1.Cells[i,0]:='Drehzahlstufe 7';
  for j:=1 to 16 do begin
    i:=i+1;
    StringGrid1.Cells[i,0]:='Sensor '+IntToStr(j);
  end;
  i:=i+1;
  StringGrid1.Cells[i,0]:='WMZ';
  i:=i+1;
  StringGrid1.Cells[i,0]:='Momentanlstg 1';
  i:=i+1;
  StringGrid1.Cells[i,0]:='kWh 1';
  i:=i+1;
  StringGrid1.Cells[i,0]:='MWh 1';
  i:=i+1;
  StringGrid1.Cells[i,0]:='Momentanlstg 2';
  i:=i+1;
  StringGrid1.Cells[i,0]:='kWh 2';
  i:=i+1;
  StringGrid1.Cells[i,0]:='MWh 2';

end;

procedure TForm1.XMLPropStorage1RestoreProperties(Sender: TObject);
begin

end;

end.

