
unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Menus, XMLPropStorage, ExtDlgs, Grids, EditBtn,
  Spin, ExtendedNotebook, TAGraph, TASources, TAIntervalSources, TASeries,
  TARadialSeries, TATools, TAChartExtentLink, ZVDateTimePicker, u_linsoldat,
  dateutils, types;

type
  { TForm1 }
  TForm1 = class(TForm)
    Button_GetSpeicherkriterium: TButton;
    Button_alleDaten: TButton;
    Button_Modultype: TButton;
    Button_ModulModus: TButton;
    Button_SetSpeicherkriterium: TButton;
    Button_Daten_anzeigen: TButton;
    Button_tab_save_as_csv: TButton;
    Button_TagMinus: TButton;
    Button_TagPlus: TButton;
    Button_Verzeichnis: TButton;
    Button_Start: TButton;
    CBox_SpeicherZeit: TComboBox;
    ChartExtentLink1: TChartExtentLink;
    ChartToolset1DataPointCrosshairTool1: TDataPointCrosshairTool;
    ChartToolset1DataPointHintTool1: TDataPointHintTool;
    ChartToolset1ZoomDragTool1: TZoomDragTool;
    Chart_Lstg: TChart;
    ChartSensoren: TChart;
    ChartAusgaenge: TChart;
    ChartToolset1: TChartToolset;
    ChartToolset1PanDragTool1: TPanDragTool;
    CheckGroupSensoren: TCheckGroup;
    CheckGroupAusgaenge: TCheckGroup;
    ColorButton_A1: TColorButton;
    ColorButton_A2: TColorButton;
    ColorButton_A3: TColorButton;
    ColorButton_A4: TColorButton;
    ColorButton_A5: TColorButton;
    ColorButton_A6: TColorButton;
    ColorButton_A7: TColorButton;
    ColorButton_A8: TColorButton;
    ColorButton_A9: TColorButton;
    ColorButton_A10: TColorButton;
    ColorButton_A11: TColorButton;
    ColorButton_A12: TColorButton;
    ColorButton_A13: TColorButton;
    ColorButton_S1: TColorButton;
    ColorButton_S10: TColorButton;
    ColorButton_S11: TColorButton;
    ColorButton_S12: TColorButton;
    ColorButton_S13: TColorButton;
    ColorButton_S14: TColorButton;
    ColorButton_S15: TColorButton;
    ColorButton_S16: TColorButton;
    ColorButton_S2: TColorButton;
    ColorButton_S3: TColorButton;
    ColorButton_S4: TColorButton;
    ColorButton_S5: TColorButton;
    ColorButton_S6: TColorButton;
    ColorButton_S7: TColorButton;
    ColorButton_S8: TColorButton;
    ColorButton_S9: TColorButton;
    ComboBox1: TComboBox;
    DateEdit_Ende: TDateEdit;
    DateEdit_Start: TDateEdit;
    DateTimeIntervalChartSource1: TDateTimeIntervalChartSource;
    DateTimeIntervalChartSource_Lstg: TDateTimeIntervalChartSource;
    Edit_Modultyp: TEdit;
    Edit_ModulModus: TEdit;
    Edit_IP: TEdit;
    Edit_Port: TEdit;
    Edit_Verzeichnis: TEdit;
    ExtendedNotebook1: TExtendedNotebook;
    FloatSpin_Kelvin: TFloatSpinEdit;
    GroupBox1: TGroupBox;
    GroupBox_ModusFirmware: TGroupBox;
    GroupBox_Pfad: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox_Diagramm: TGroupBox;
    GroupBox_SpKriterium: TGroupBox;
    GroupBox_SensorFarbe: TGroupBox;
    GroupBox_AusgangFarbe: TGroupBox;
    GroupBox_Netz: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image_Tmp: TImage;
    LA1: TLabel;
    LA10: TLabel;
    LA11: TLabel;
    LA12: TLabel;
    LA13: TLabel;
    LZeit: TLabel;
    LA2: TLabel;
    LA3: TLabel;
    LA4: TLabel;
    LA5: TLabel;
    LA6: TLabel;
    LA7: TLabel;
    LA8: TLabel;
    LA9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label_LogDatei: TLabel;
    LstChartS1: TListChartSource;
    LMomLstg1: TLabel;
    LMomLstg2: TLabel;
    LS1: TLabel;
    LS10: TLabel;
    LS11: TLabel;
    LS12: TLabel;
    LS13: TLabel;
    LS14: TLabel;
    LS15: TLabel;
    LS16: TLabel;
    LS2: TLabel;
    LS3: TLabel;
    LS4: TLabel;
    LS5: TLabel;
    LS6: TLabel;
    LS7: TLabel;
    LS8: TLabel;
    LS9: TLabel;
    LWMCounter1: TLabel;
    LWMCounter2: TLabel;
    MenuItem_Crosshair: TMenuItem;
    MenuItem_Datenwert: TMenuItem;
    MenuItem_Strich: TMenuItem;
    MenuItem_GitterChartSens_v: TMenuItem;
    MenuItem_SensorFenster: TMenuItem;
    MenuItem_Beschriftung: TMenuItem;
    MenuItem_GitterChartAusg: TMenuItem;
    MenuItem_GitterChartSens_h: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    PopupMenuBeschriftung: TPopupMenu;
    PopupMenuChartAusgang: TPopupMenu;
    PopupMenuChartSensor: TPopupMenu;
    RB_SpeicherTime: TRadioButton;
    RadioGroup1: TRadioGroup;
    Radio_auto: TRadioButton;
    Radio_manuell: TRadioButton;
    RB_SpeicherKelvin: TRadioButton;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem_HBild: TMenuItem;
    MenuItem_Setup: TMenuItem;
    MenuItem_About: TMenuItem;
    MenuItem_Help: TMenuItem;
    MenuItem_Exit: TMenuItem;
    MenuItem_File: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    StaticText6: TStaticText;
    StaticText_Sekunden: TStaticText;
    StaticText_Timer: TLabel;
    StaticText_ZeitBis: TLabel;
    StringGrid1: TStringGrid;
    aktDaten: TTabSheet;
    Einstellungen: TTabSheet;
    Diagramm: TTabSheet;
    Tabelle: TTabSheet;
    Leistung: TTabSheet;
    Timer1: TTimer;
    Timer2: TTimer;
    TrackBar_Zeit: TTrackBar;
    XMLPropStorage1: TXMLPropStorage;
    DateEdit_Einzeltag: TZVDateTimePicker;
    procedure Benamung_Form_Sensoren(Sender: TObject);
    procedure Button_GetSpeicherkriteriumClick(Sender: TObject);
    procedure Button_ModulModusClick(Sender: TObject);
    procedure Button_ModultypeClick(Sender: TObject);
    procedure Button_SetSpeicherkriteriumClick(Sender: TObject);
    procedure Button_tab_save_as_csvClick(Sender: TObject);
    procedure Button_TagMinusClick(Sender: TObject);
    procedure Button_TagPlusClick(Sender: TObject);
    procedure ChartToolset1DataPointHintTool1Hint(ATool: TDataPointHintTool;
      const APoint: TPoint; var AHint: String);
    procedure ChartToolset1ZoomDragTool1AfterMouseDown(ATool: TChartTool;
      APoint: TPoint);
    procedure Chart_LstgAxisList1MarkToText(var AText: String; AMark: Double);
    procedure CheckGroupAusgaengeItemClick(Sender: TObject; Index: integer);
    procedure CheckGroupSensorenItemClick(Sender: TObject; Index: integer);
    procedure ColorButton_A10ColorChanged(Sender: TObject);
    procedure ColorButton_A11ColorChanged(Sender: TObject);
    procedure ColorButton_A12ColorChanged(Sender: TObject);
    procedure ColorButton_A13ColorChanged(Sender: TObject);
    procedure ColorButton_A1ColorChanged(Sender: TObject);
    procedure ColorButton_A2ColorChanged(Sender: TObject);
    procedure ColorButton_A3ColorChanged(Sender: TObject);
    procedure ColorButton_A4ColorChanged(Sender: TObject);
    procedure ColorButton_A5ColorChanged(Sender: TObject);
    procedure ColorButton_A6ColorChanged(Sender: TObject);
    procedure ColorButton_A7ColorChanged(Sender: TObject);
    procedure ColorButton_A8ColorChanged(Sender: TObject);
    procedure ColorButton_A9ColorChanged(Sender: TObject);
    procedure ColorButton_S10ColorChanged(Sender: TObject);
    procedure ColorButton_S11ColorChanged(Sender: TObject);
    procedure ColorButton_S12ColorChanged(Sender: TObject);
    procedure ColorButton_S13ColorChanged(Sender: TObject);
    procedure ColorButton_S14ColorChanged(Sender: TObject);
    procedure ColorButton_S15ColorChanged(Sender: TObject);
    procedure ColorButton_S16ColorChanged(Sender: TObject);
    procedure ColorButton_S1ColorChanged(Sender: TObject);
    procedure ColorButton_S2ColorChanged(Sender: TObject);
    procedure ColorButton_S3ColorChanged(Sender: TObject);
    procedure ColorButton_S4ColorChanged(Sender: TObject);
    procedure ColorButton_S5ColorChanged(Sender: TObject);
    procedure ColorButton_S6ColorChanged(Sender: TObject);
    procedure ColorButton_S7ColorChanged(Sender: TObject);
    procedure ColorButton_S8ColorChanged(Sender: TObject);
    procedure ColorButton_S9ColorChanged(Sender: TObject);
    procedure DateEdit_EinzeltagChange(Sender: TObject);
    procedure DateEdit_EinzeltagClick(Sender: TObject);
    procedure DateEdit_EinzeltagCloseUp(Sender: TObject);
    procedure DateEdit_EinzeltagExit(Sender: TObject);
    procedure DateEdit_EndeExit(Sender: TObject);
    procedure DateEdit_StartExit(Sender: TObject);
    procedure Daten_anzeigen_Einzeltag(EinzelTag: TDate);
    procedure Edit_VerzeichnisClick(Sender: TObject);
    procedure ExtendedNotebook1Change(Sender: TObject);
    procedure GroupBox2Resize(Sender: TObject);
    procedure GroupBox_AusgangFarbeResize(Sender: TObject);
    procedure GroupBox_DiagrammResize(Sender: TObject);
    procedure GroupBox_SensorFarbeResize(Sender: TObject);
    procedure GroupBox_SpKriteriumResize(Sender: TObject);
    procedure Label1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure Label2EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure Label3EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure Label4EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure Label5EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LZeitEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure MenuItem_BeschriftungClick(Sender: TObject);
    procedure MenuItem_CrosshairClick(Sender: TObject);
    procedure MenuItem_DatenwertClick(Sender: TObject);
    procedure MenuItem_GitterChartAusgClick(Sender: TObject);
    procedure MenuItem_GitterChartSens_hClick(Sender: TObject);
    procedure MenuItem_GitterChartSens_vClick(Sender: TObject);
    procedure MenuItem_SensorFensterClick(Sender: TObject);
    procedure Radio_autoChange(Sender: TObject);
    procedure RB_SpeicherKelvinChange(Sender: TObject);
    procedure RB_SpeicherTimeChange(Sender: TObject);
    procedure TabellenKopf();
    procedure Button_Daten_anzeigenClick(Sender: TObject);
    procedure Button_StartClick(Sender: TObject);
    procedure Button_VerzeichnisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Image1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure LA1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LA2EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LA3EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LA4EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LA5EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LA6EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LA7EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LA8EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LA9EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LA10EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LA11EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LA12EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LA13EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LMomLstg1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LMomLstg2EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS10EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS11EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS12EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS13EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS14EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS15EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS16EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS2EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS3EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS4EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS5EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS6EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS7EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS8EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LS9EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LWMCounter1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LWMCounter2EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure MenuItem_HBildClick(Sender: TObject);
    procedure MenuItem_SetupClick(Sender: TObject);
    procedure MenuItem_AboutClick(Sender: TObject);
    procedure MenuItem_ExitClick(Sender: TObject);
    procedure RadioButton_IPClick(Sender: TObject);
    procedure Radio_manuellClick(Sender: TObject);
    procedure Radio_autoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure TrackBar_ZeitChange(Sender: TObject);
    procedure Use_aktDaten();
    procedure XMLPropStorage1RestoreProperties(Sender: TObject);
    procedure XMLPropStorage1SavingProperties(Sender: TObject);
    procedure LineChartColor();
  private
    { private declarations }
  public
    { public declarations }
  end;

//const

var
//  VERSIONSABFRAGE: Integer = 129; // = $81 = 0x81
//  MODEABFRAGE: Integer = 130; // = $82 = 0x82
//  AKTUELLEDATENLESEN: Integer = 171; // = $AB = 0xAB
//  KONFIGCAN: Integer = $97; // 0x97
  ZeitAktualisierung: Integer;
  USB_Port: String;
  Commando: String;
  Param_1 : String;
  Verbindung_OK : Boolean = False;
  Form1: TForm1;
  SolDat  : TSolDat;
  LineChartAusgArr : array [0..12] of TLineSeries;
  LineChartSensArr : array [0..15] of TLineSeries;
  BarChartLstg1    : TBarSeries;
  BarChartLstg2    : TBarSeries;
  dt_tmp           : TDateTime;
  EinzelTag        : Boolean;
  EinzelTagAcceptDay : Boolean;

implementation

uses
  TAChartUtils, TACustomSeries, unit_form_sensoren;

{ TForm1 }

procedure TForm1.Button_StartClick(Sender: TObject);
begin
  SolDat.BLNetIPAdresse:=Edit_IP.Text;
  SolDat.BLNetPort:=StrToInt(Edit_Port.Text);
  if Radio_auto.Checked then
  begin
     Timer1.Interval:=ZeitAktualisierung * 1000;
     if Button_Start.Tag = 0 then
        begin
           Button_Start.Tag:= 1;
           Button_Start.Caption:='Stop';
           Timer1.Enabled:=True;
           Timer2.Enabled:=True;
           RadioGroup1.Enabled:=False;
           TrackBar_Zeit.Enabled:=False;
           Edit_IP.Enabled:=False;
           Edit_Port.Enabled:=False;
           if SolDat.AktuelleDatenLesen then
             Use_aktDaten();
         end
     else begin
         Button_Start.Tag:= 0;
         Button_Start.Caption:='Start';
         Timer1.Enabled:=False;
         Timer2.Enabled:=False;
         RadioGroup1.Enabled:=True;
         Edit_IP.Enabled:=True;
         Edit_Port.Enabled:=True;
         TrackBar_Zeit.Enabled:=True;
         ZeitAktualisierung:=TrackBar_Zeit.Position;
         StaticText_Timer.Caption:=IntToStr(ZeitAktualisierung)
     end;
  end
  else begin
    if SolDat.AktuelleDatenLesen then
      Use_aktDaten();
  end;
end;

procedure TForm1.Button_VerzeichnisClick(Sender: TObject);
begin
   SolDat.LogDatenDir := Edit_Verzeichnis.Text;
   Label_LogDatei.Caption:='Log-Dir: '+Edit_Verzeichnis.Caption;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

procedure TForm1.Button_Daten_anzeigenClick(Sender: TObject);
var
  i, j, k, anzahl                    : Integer;
  Lstg1, merkLstg1, Lstg2, merkLstg2 : Single;
  Ausgang                            : TAusgang;
  dt, merkDay                        : TDateTime;
  CursorSave                         : TCursor;
begin
  if DateEdit_Ende.Date < DateEdit_Start.Date then begin
     ShowMessage('Das Ende-Datum liegt vor dem Start-Datum!'+#13#10+
     'Bitte korrigieren.');
     DateEdit_Start.SetFocus;
     exit;
  end;
  if DaySpan(DateEdit_Ende.Date,DateEdit_Start.Date) > 152 then begin
    ShowMessage('Bitte nur einen Zeitraum von max. 5 Monaten wählen.');
    DateEdit_Start.SetFocus;
    exit;
  end;
  SolDat.LogDatenDir:=Edit_Verzeichnis.Text;
  if NOT SolDat.SolDat[DateEdit_Start.Date,DateEdit_Ende.Date] then begin
    ShowMessage('Keine Daten gefunden!');
    exit;
  end;

  Label_LogDatei.Caption:='Log-Dir: '+SolDat.LogDatenDir;
  anzahl:=Length(SolDat.SolDatRecArray);
  CursorSave:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  Application.ProcessMessages;

  // LineChart:
  for k:=0 to 12 do begin
    LineChartAusgArr[k].Clear;
    if CheckGroupAusgaenge.Checked[k] then
      LineChartAusgArr[k].Active:=True
    else
      LineChartAusgArr[k].Active:=False;
  end;
  for k:=0 to 15 do begin
    LineChartSensArr[k].Clear;
    LineChartSensArr[k].LineType:=ltFromPrevious;
    if CheckGroupSensoren.Checked[k] then
      LineChartSensArr[k].Active:=True
    else
      LineChartSensArr[k].Active:=False;
  end;
  BarChartLstg1.Clear;
  BarChartLstg2.Clear;

  if anzahl < 1 then begin
    ExtendedNotebook1.Page[1].TabVisible:=False;
    Screen.Cursor:=CursorSave;
    ShowMessage('Keine Daten gefunden!');
    exit;
  end;
  if DaySpan(DateEdit_Ende.Date,DateEdit_Start.Date) > 5 then
    ExtendedNotebook1.Page[1].TabVisible:=True
  else
    ExtendedNotebook1.Page[1].TabVisible:=False;

  LineChartColor();
  ChartExtentLink1.Enabled:=False;

  BarChartLstg1.Marks.Style:=TSeriesMarksStyle(smsValue);
  BarChartLstg1.Marks.Format:='%0:4.2g kWh';
  BarChartLstg2.Marks.Style:=TSeriesMarksStyle(smsValue);

  merkDay:=0;
  merkLstg1:=0;
  merkLstg2:=0;
  dt := now;
  StringGrid1.Clean;
  StringGrid1.RowCount:=anzahl+1;
  TabellenKopf();
  for i:=0 to anzahl-1 do begin
    if merkDay = 0 then begin
      merkDay:=DateOf(SolDat.SolDatRecArray[i].RDateTime);
      dt:=SolDat.SolDatRecArray[i].RDateTime;
      DateEdit_Start.Date:=merkDay;
      DateEdit_Einzeltag.Date:=merkDay;
      dt_tmp:=merkDay;
    end;
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
      if SolDat.SolDatRecArray[i].Ausgaenge[k] then
         StringGrid1.Cells[j,i+1]:='1'
      else
         StringGrid1.Cells[j,i+1]:='0';
      LineChartAusgArr[k].AddXY(SolDat.SolDatRecArray[i].RDateTime,k*1.2+StrToInt(StringGrid1.Cells[j,i+1]));
      j:=j+1;
    end;
    StringGrid1.Cells[j,i+1]:=IntToStr(SolDat.SolDatRecArray[i].dza1_stufe);
    j:=j+1;
    StringGrid1.Cells[j,i+1]:=IntToStr(SolDat.SolDatRecArray[i].dza2_stufe);
    j:=j+1;
    StringGrid1.Cells[j,i+1]:=IntToStr(SolDat.SolDatRecArray[i].dza6_stufe);
    j:=j+1;
    StringGrid1.Cells[j,i+1]:=IntToStr(SolDat.SolDatRecArray[i].dza7_stufe);
    j:=j+1;
    for k:=0 to 15 do begin
      StringGrid1.Cells[j,i+1]:=FormatFloat('###,##0.##;-##0.##',SolDat.SolDatRecArray[i].Sensoren[k]);
      LineChartSensArr[k].AddXY(SolDat.SolDatRecArray[i].RDateTime,SolDat.SolDatRecArray[i].Sensoren[k]);
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
       Lstg1:=SolDat.SolDatRecArray[i].mwh1*1000+SolDat.SolDatRecArray[i].Kwh1;
       if merkLstg1 = 0 then
         merkLstg1:=Lstg1;
       StringGrid1.Cells[j,i+1]:=FormatFloat('##0.##;-##0.##',SolDat.SolDatRecArray[i].Lstg1);
       j:=j+1;
       StringGrid1.Cells[j,i+1]:=FormatFloat('###,##0.##',SolDat.SolDatRecArray[i].Kwh1);
       j:=j+1;
       StringGrid1.Cells[j,i+1]:=FormatFloat('###,##0.##;',SolDat.SolDatRecArray[i].mwh1);
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
       Lstg2:=SolDat.SolDatRecArray[i].mwh2*1000+SolDat.SolDatRecArray[i].Kwh2;
       if merkLstg2 = 0 then
         merkLstg2:=Lstg2;
       StringGrid1.Cells[j,i+1]:=FormatFloat('##0.##;-##0.##',SolDat.SolDatRecArray[i].Lstg2);
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
    if (DateOf(SolDat.SolDatRecArray[i].RDateTime) > merkDay) or (i = anzahl-1) then begin
       if (SolDat.SolDatRecArray[i].Wmz1_aktiv) then begin
         BarChartLstg1.AddXY(dt,Lstg1-merkLstg1,DateTimeToStr(DateOf(merkDay)) );
         merkLstg1:=Lstg1;
       end;
       if (SolDat.SolDatRecArray[i].Wmz2_aktiv) then begin
         BarChartLstg2.AddXY(dt,Lstg2-merkLstg2,DateTimeToStr(DateOf(merkDay)) );
         merkLstg2:=Lstg2;
       end;
       merkDay:=DateOf(SolDat.SolDatRecArray[i].RDateTime);
       dt:=SolDat.SolDatRecArray[i].RDateTime;
    end;
  end; // for i:=0 to anzahl-1 do
  DateEdit_Ende.Date:=merkDay;
  StringGrid1.AutoSizeColumns;
  DateTimeIntervalChartSource_Lstg.DateTimeFormat:='DD.MM.';
  DateTimeIntervalChartSource1.DateTimeFormat:='hh:mm'+#13#10+'DD.MM.';
  Chart_Lstg.ZoomFull;
  ChartAusgaenge.ZoomFull;
  ChartSensoren.ZoomFull;
  Screen.Cursor:=CursorSave;
  MenuItem_GitterChartAusg.Enabled:=True;
  MenuItem_GitterChartSens_h.Enabled:=True;
  MenuItem_GitterChartSens_v.Enabled:=True;
  MenuItem_SensorFenster.Enabled:=True;
  MenuItem_Crosshair.Enabled:=True;
  MenuItem_Datenwert.Enabled:=True;
  Button_tab_save_as_csv.Enabled:=True;
  if not SameDate(DateEdit_Start.Date,DateEdit_Ende.Date) then begin
     Button_TagMinus.Enabled:=True;
     Button_TagPlus.Enabled:=True;
     DateEdit_Einzeltag.Enabled:=True;
  end;
  Button_alleDaten.Enabled:=False;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  result : String;
  i      : Integer;
begin
  SolDat:=TSolDat.Create;
  Edit_Verzeichnis.Text:=XMLPropStorage1.StoredValue['Edit_Verzeichnis_Text'];
  SolDat.LogDatenDir := XMLPropStorage1.StoredValue['Edit_Verzeichnis_Text'];
  Form1.DoubleBuffered:=True; // flackern beim Bildaufbau vermeiden

  for i:=0 to 12 do begin
    LineChartAusgArr[i]:= TLineSeries.Create(ChartAusgaenge);
    LineChartAusgArr[i].LineType:=ltStepXY;
    ChartAusgaenge.AddSeries(LineChartAusgArr[i]);
  end;
  for i:=0 to 15 do begin
    LineChartSensArr[i]:=TLineSeries.Create(ChartSensoren);
    ChartSensoren.AddSeries(LineChartSensArr[i]);
  end;
  BarChartLstg1:=TBarSeries.Create(Chart_Lstg);
  Chart_Lstg.AddSeries(BarChartLstg1);
  BarChartLstg1.SeriesColor:=clRed;
  BarChartLstg2:=TBarSeries.Create(Chart_Lstg);
  Chart_Lstg.AddSeries(BarChartLstg2);
  BarChartLstg2.SeriesColor:=clBlue;

//  DateEdit_Start.Text:='01.'+IntToStr(MonthOf(now))+'.'+IntToStr(YearOf(now));
//  DateEdit_Ende.Text:=FormatDateTime('dd.mm.yyyy',Now);
  ZeitAktualisierung:=30;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  if (Self.Width < 814) then Self.Width:= 813;
  if (Self.Height < 729) then Self.Height:=728;
end;

procedure TForm1.Image1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if (Source is TLabel) then
    Accept := True;
end;

procedure TForm1.LA1EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LA1.Top := P.Y + Image1.Top - LA1.Height div 2 ;
  LA1.Left := P.X + Image1.Left;
  LA1.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LA1.Top := P.Y + Image2.Top - LA1.Height div 2 ;
    LA1.Left := P.X + Image2.Left ;
    LA1.Tag:=0;
  end;
end;

procedure TForm1.LA2EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LA2.Top := P.Y + Image1.Top - LA2.Height div 2 ;
  LA2.Left := P.X + Image1.Left;
  LA2.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LA2.Top := P.Y + Image2.Top - LA2.Height div 2 ;
    LA2.Left := P.X + Image2.Left ;
    LA2.Tag:=0;
  end;
end;

procedure TForm1.LA3EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LA3.Top := P.Y + Image1.Top - LA3.Height div 2 ;
  LA3.Left := P.X + Image1.Left;
  LA3.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LA3.Top := P.Y + Image2.Top - LA3.Height div 2 ;
    LA3.Left := P.X + Image2.Left ;
    LA3.Tag:=0;
  end;
end;

procedure TForm1.LA4EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LA4.Top := P.Y + Image1.Top - LA4.Height div 2 ;
  LA4.Left := P.X + Image1.Left;
  LA4.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LA4.Top := P.Y + Image2.Top - LA4.Height div 2 ;
    LA4.Left := P.X + Image2.Left ;
    LA4.Tag:=0;
  end;
end;

procedure TForm1.LA5EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LA5.Top := P.Y + Image1.Top - LA5.Height div 2 ;
  LA5.Left := P.X + Image1.Left;
  LA5.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LA5.Top := P.Y + Image2.Top - LA5.Height div 2 ;
    LA5.Left := P.X + Image2.Left ;
    LA5.Tag:=0;
  end;
end;

procedure TForm1.LA6EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LA6.Top := P.Y + Image1.Top - LA6.Height div 2 ;
  LA6.Left := P.X + Image1.Left;
  LA6.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LA6.Top := P.Y + Image2.Top - LA6.Height div 2 ;
    LA6.Left := P.X + Image2.Left ;
    LA6.Tag:=0;
  end;
end;

procedure TForm1.LA7EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LA7.Top := P.Y + Image1.Top - LA7.Height div 2 ;
  LA7.Left := P.X + Image1.Left;
  LA7.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LA7.Top := P.Y + Image2.Top - LA7.Height div 2 ;
    LA1.Left := P.X + Image2.Left ;
    LA7.Tag:=0;
  end;
end;

procedure TForm1.LA8EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LA8.Top := P.Y + Image1.Top - LA8.Height div 2 ;
  LA8.Left := P.X + Image1.Left;
  LA8.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LA8.Top := P.Y + Image2.Top - LA8.Height div 2 ;
    LA8.Left := P.X + Image2.Left ;
    LA8.Tag:=0;
  end;
end;

procedure TForm1.LA9EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LA9.Top := P.Y + Image1.Top - LA9.Height div 2 ;
  LA9.Left := P.X + Image1.Left;
  LA9.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LA9.Top := P.Y + Image2.Top - LA9.Height div 2 ;
    LA9.Left := P.X + Image2.Left ;
    LA9.Tag:=0;
  end;
end;

procedure TForm1.LA10EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LA10.Top := P.Y + Image1.Top - LA10.Height div 2 ;
  LA10.Left := P.X + Image1.Left;
  LA10.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LA10.Top := P.Y + Image2.Top - LA10.Height div 2 ;
    LA10.Left := P.X + Image2.Left ;
    LA10.Tag:=0;
  end;
end;

procedure TForm1.LA11EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LA11.Top := P.Y + Image1.Top - LA11.Height div 2 ;
  LA11.Left := P.X + Image1.Left;
  LA11.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LA11.Top := P.Y + Image2.Top - LA11.Height div 2 ;
    LA11.Left := P.X + Image2.Left ;
    LA11.Tag:=0;
  end;
end;

procedure TForm1.LA12EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LA12.Top := P.Y + Image1.Top - LA12.Height div 2 ;
  LA12.Left := P.X + Image1.Left;
  LA12.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LA12.Top := P.Y + Image2.Top - LA12.Height div 2 ;
    LA12.Left := P.X + Image2.Left ;
    LA12.Tag:=0;
  end;
end;

procedure TForm1.LA13EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LA13.Top := P.Y + Image1.Top - LA13.Height div 2 ;
  LA13.Left := P.X + Image1.Left;
  LA13.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LA13.Top := P.Y + Image2.Top - LA13.Height div 2 ;
    LA13.Left := P.X + Image2.Left ;
    LA13.Tag:=0;
  end;
end;

procedure TForm1.LMomLstg1EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LMomLstg1.Top := P.Y + Image1.Top - LMomLstg1.Height div 2 ;
  LMomLstg1.Left := P.X + Image1.Left;
  LMomLstg1.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LMomLstg1.Top := P.Y + Image2.Top - LMomLstg1.Height div 2 ;
    LMomLstg1.Left := P.X + Image2.Left ;
    LMomLstg1.Tag:=0;
  end;
end;

procedure TForm1.LMomLstg2EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LMomLstg2.Top := P.Y + Image1.Top - LMomLstg2.Height div 2 ;
  LMomLstg2.Left := P.X + Image1.Left;
  LMomLstg2.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LMomLstg2.Top := P.Y + Image2.Top - LMomLstg2.Height div 2 ;
    LMomLstg2.Left := P.X + Image2.Left ;
    LMomLstg2.Tag:=0;
  end;
end;

procedure TForm1.LS10EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS10.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS10.Left := P.X + Image1.Left; // - LS16.Width div 2 ;
  LS10.Tag:=1;
  end;
//  ShowMessage(Format('x:%d y:%d', [P.X, P.Y]));
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS10.Top := P.Y + Image2.Top - LS10.Height div 2 ;
    LS10.Left := P.X + Image2.Left ;
    LS10.Tag:=0;
  end;
end;

procedure TForm1.LS11EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS11.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS11.Left := P.X + Image1.Left;
  LS11.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS11.Top := P.Y + Image2.Top - LS11.Height div 2 ;
    LS11.Left := P.X + Image2.Left ;
    LS11.Tag:=0;
  end;
end;

procedure TForm1.LS12EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS12.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS12.Left := P.X + Image1.Left;
  LS12.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS12.Top := P.Y + Image2.Top - LS12.Height div 2 ;
    LS12.Left := P.X + Image2.Left ;
    LS12.Tag:=0;
  end;
end;

procedure TForm1.LS13EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS13.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS13.Left := P.X + Image1.Left;
  LS13.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS13.Top := P.Y + Image2.Top - LS13.Height div 2 ;
    LS13.Left := P.X + Image2.Left ;
    LS13.Tag:=0;
  end;
end;

procedure TForm1.LS14EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS14.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS14.Left := P.X + Image1.Left;
  LS14.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS14.Top := P.Y + Image2.Top - LS14.Height div 2 ;
    LS14.Left := P.X + Image2.Left ;
    LS14.Tag:=0;
  end;
end;

procedure TForm1.LS15EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS15.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS15.Left := P.X + Image1.Left;
  LS15.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS15.Top := P.Y + Image2.Top - LS15.Height div 2 ;
    LS15.Left := P.X + Image2.Left ;
    LS15.Tag:=0;
  end;
end;

procedure TForm1.LS16EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS16.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS16.Left := P.X + Image1.Left;
  LS16.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS16.Top := P.Y + Image2.Top - LS16.Height div 2 ;
    LS16.Left := P.X + Image2.Left ;
    LS16.Tag:=0;
  end;
end;

procedure TForm1.LS1EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS1.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS1.Left := P.X + Image1.Left;
  LS1.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS1.Top := P.Y + Image2.Top - LS16.Height div 2 ;
    LS1.Left := P.X + Image2.Left ;
    LS1.Tag:=0;
  end;
end;

procedure TForm1.LS2EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS2.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS2.Left := P.X + Image1.Left;
  LS2.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS2.Top := P.Y + Image2.Top - LS16.Height div 2 ;
    LS2.Left := P.X + Image2.Left ;
    LS2.Tag:=0;
  end;
end;

procedure TForm1.LS3EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS3.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS3.Left := P.X + Image1.Left;
  LS3.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS3.Top := P.Y + Image2.Top - LS16.Height div 2 ;
    LS3.Left := P.X + Image2.Left ;
    LS3.Tag:=0;
  end;
end;

procedure TForm1.LS4EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS4.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS4.Left := P.X + Image1.Left;
  LS4.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS4.Top := P.Y + Image2.Top - LS16.Height div 2 ;
    LS4.Left := P.X + Image2.Left ;
    LS4.Tag:=0;
  end;
end;

procedure TForm1.LS5EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS5.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS5.Left := P.X + Image1.Left;
  LS5.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS5.Top := P.Y + Image2.Top - LS16.Height div 2 ;
    LS5.Left := P.X + Image2.Left ;
    LS5.Tag:=0;
  end;
end;

procedure TForm1.LS6EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS6.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS6.Left := P.X + Image1.Left;
  LS6.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS6.Top := P.Y + Image2.Top - LS16.Height div 2 ;
    LS6.Left := P.X + Image2.Left ;
    LS6.Tag:=0;
  end;
end;

procedure TForm1.LS7EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS7.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS7.Left := P.X + Image1.Left;
  LS7.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS7.Top := P.Y + Image2.Top - LS16.Height div 2 ;
    LS7.Left := P.X + Image2.Left ;
    LS7.Tag:=0;
  end;
end;

procedure TForm1.LS8EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS8.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS8.Left := P.X + Image1.Left;
  LS8.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS8.Top := P.Y + Image2.Top - LS16.Height div 2 ;
    LS8.Left := P.X + Image2.Left ;
    LS8.Tag:=0;
  end;
end;

procedure TForm1.LS9EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LS9.Top := P.Y + Image1.Top - LS16.Height div 2 ;
  LS9.Left := P.X + Image1.Left;
  LS9.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LS9.Top := P.Y + Image2.Top - LS16.Height div 2 ;
    LS9.Left := P.X + Image2.Left ;
    LS9.Tag:=0;
  end;
end;

procedure TForm1.LWMCounter1EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LWMCounter1.Top := P.Y + Image1.Top - LWMCounter1.Height div 2 ;
  LWMCounter1.Left := P.X + Image1.Left;
  LWMCounter1.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LWMCounter1.Top := P.Y + Image2.Top - LWMCounter1.Height div 2 ;
    LWMCounter1.Left := P.X + Image2.Left ;
    LWMCounter1.Tag:=0;
  end;
end;

procedure TForm1.LWMCounter2EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LWMCounter2.Top := P.Y + Image1.Top - LWMCounter2.Height div 2 ;
  LWMCounter2.Left := P.X + Image1.Left;
  LWMCounter2.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LWMCounter2.Top := P.Y + Image2.Top - LWMCounter2.Height div 2 ;
    LWMCounter2.Left := P.X + Image2.Left ;
    LWMCounter2.Tag:=0;
  end;
end;

procedure TForm1.MenuItem_HBildClick(Sender: TObject);
var
  BildDatei: AnsiString;
begin
  ExtendedNotebook1.ActivePageIndex:=0;
  if OpenPictureDialog1.Execute then
  begin
    BildDatei := OpenPictureDialog1.FileName;
    Image_Tmp.Picture.LoadFromFile(BildDatei);
    if (Image_Tmp.Picture.Width > 640) or (Image_Tmp.Picture.Height > 480) then begin
      ShowMessage('Die Bildgroesse darf max. 640x480 sein.');
      exit;
    end;    Image1.Picture.LoadFromFile(BildDatei);
    // Bildgroesse auf 640*480 begrenzen
    with Image1.Picture.Bitmap do begin
      Height:= 480;
      Width:= 640;
    end;
    XMLPropStorage1.StoredValue['item_HBild']:= BildDatei;
  end;
end;

procedure TForm1.MenuItem_SetupClick(Sender: TObject);
begin
  if (MenuItem_Setup.Tag = 0) then begin
    MenuItem_Setup.Tag := 1;
    MenuItem_Setup.Checked:= True;
    ExtendedNotebook1.ActivePageIndex:=0;
    if Button_Start.Tag = 1 then
      Button_StartClick(Self);
    Button_Start.Enabled:=False;
    RadioGroup1.Enabled:=False;
//    Image2.Visible:=False;
//    Image2.Enabled:=False;
//    Image2.SendToBack;
//    Image3.SendToBack;
    Image2.Visible:=True;

    LS1.DragMode:=dmAutomatic;
    LS1.Caption:=LS1.Caption+' (S1)';
    LS1.Visible:=True;
    LS2.DragMode:=dmAutomatic;
    LS2.Caption:=LS2.Caption+' (S2)';
    LS2.Visible:=True;
    LS3.DragMode:=dmAutomatic;
    LS3.Caption:=LS3.Caption+' (S3)';
    LS3.Visible:=True;
    LS4.DragMode:=dmAutomatic;
    LS4.Caption:=LS4.Caption+' (S4)';
    LS4.Visible:=True;
    LS5.DragMode:=dmAutomatic;
    LS5.Caption:=LS5.Caption+' (S5)';
    LS5.Visible:=True;
    LS6.DragMode:=dmAutomatic;
    LS6.Caption:=LS6.Caption+' (S6)';
    LS6.Visible:=True;
    LS7.DragMode:=dmAutomatic;
    LS7.Caption:=LS7.Caption+' (S7)';
    LS7.Visible:=True;
    LS8.DragMode:=dmAutomatic;
    LS8.Caption:=LS8.Caption+' (S8)';
    LS8.Visible:=True;
    LS9.DragMode:=dmAutomatic;
    LS9.Caption:=LS9.Caption+' (S9)';
    LS9.Visible:=True;
    LS10.DragMode:=dmAutomatic;
    LS10.Caption:=LS10.Caption+' (S10)';
    LS10.Visible:=True;
    LS11.DragMode:=dmAutomatic;
    LS11.Caption:=LS11.Caption+' (S11)';
    LS11.Visible:=True;
    LS12.DragMode:=dmAutomatic;
    LS12.Caption:=LS12.Caption+' (S12)';
    LS12.Visible:=True;
    LS13.DragMode:=dmAutomatic;
    LS13.Caption:=LS13.Caption+' (S13)';
    LS13.Visible:=True;
    LS14.DragMode:=dmAutomatic;
    LS14.Caption:=LS14.Caption+' (S14)';
    LS14.Visible:=True;
    LS15.DragMode:=dmAutomatic;
    LS15.Caption:=LS15.Caption+' (S15)';
    LS15.Visible:=True;
    LS16.DragMode:=dmAutomatic;
    LS16.Caption:=LS16.Caption+' (S16)';
    LS16.Visible:=True;
    LA1.DragMode:=dmAutomatic;
    LA1.Caption:=LA1.Caption+' (A1)';
    LA1.Visible:=True;
    LA2.DragMode:=dmAutomatic;
    LA2.Caption:=LA2.Caption+' (A2)';
    LA2.Visible:=True;
    LA3.DragMode:=dmAutomatic;
    LA3.Caption:=LA3.Caption+' (A3)';
    LA3.Visible:=True;
    LA4.DragMode:=dmAutomatic;
    LA4.Caption:=LA4.Caption+' (A4)';
    LA4.Visible:=True;
    LA5.DragMode:=dmAutomatic;
    LA5.Caption:=LA5.Caption+' (A5)';
    LA5.Visible:=True;
    LA6.DragMode:=dmAutomatic;
    LA6.Caption:=LA6.Caption+' (A6)';
    LA6.Visible:=True;
    LA7.DragMode:=dmAutomatic;
    LA7.Caption:=LA7.Caption+' (A7)';
    LA7.Visible:=True;
    LA8.DragMode:=dmAutomatic;
    LA8.Caption:=LA8.Caption+' (A8)';
    LA8.Visible:=True;
    LA9.DragMode:=dmAutomatic;
    LA9.Caption:=LA9.Caption+' (A9)';
    LA9.Visible:=True;
    LA10.DragMode:=dmAutomatic;
    LA10.Caption:=LA10.Caption+' (A10)';
    LA10.Visible:=True;
    LA11.DragMode:=dmAutomatic;
    LA11.Caption:=LA11.Caption+' (A11)';
    LA11.Visible:=True;
    LA12.DragMode:=dmAutomatic;
    LA12.Caption:=LA12.Caption+' (A12)';
    LA12.Visible:=True;
    LA13.DragMode:=dmAutomatic;
    LA13.Caption:=LA13.Caption+' (A13)';
    LA13.Visible:=True;
    LMomLstg1.DragMode:=dmAutomatic;
    LMomLstg1.Visible:=True;
    LMomLstg2.DragMode:=dmAutomatic;
    LMomLstg2.Visible:=True;
    LWMCounter1.DragMode:=dmAutomatic;
    LWMCounter1.Visible:=True;
    LWMCounter2.DragMode:=dmAutomatic;
    LWMCounter2.Visible:=True;
    LZeit.DragMode:=dmAutomatic;
    LZeit.Visible:=True;
    Label1.DragMode:=dmAutomatic;
    Label1.Visible:=True;
    Label2.DragMode:=dmAutomatic;
    Label2.Visible:=True;
    Label3.DragMode:=dmAutomatic;
    Label3.Visible:=True;
    Label4.DragMode:=dmAutomatic;
    Label4.Visible:=True;
    Label5.DragMode:=dmAutomatic;
    Label5.Visible:=True;
  end
  else begin
    MenuItem_Setup.Tag := 0;
    MenuItem_Setup.Checked:= False;
    RadioGroup1.Enabled:=True;
    Button_Start.Enabled:=True;
    LS1.DragMode:=dmManual;
    LS1.Caption:=LeftStr(LS1.Caption,LastDelimiter('(',LS1.Caption)-2);
    if LS1.Tag = 0 then LS1.Visible:=False;
    LS2.DragMode:=dmManual;
    LS2.Caption:=LeftStr(LS2.Caption,LastDelimiter('(',LS2.Caption)-2);
    if LS2.Tag = 0 then LS2.Visible:=False;
    LS3.DragMode:=dmManual;
    LS3.Caption:=LeftStr(LS3.Caption,LastDelimiter('(',LS3.Caption)-2);
    if LS3.Tag = 0 then LS3.Visible:=False;
    LS4.DragMode:=dmManual;
    LS4.Caption:=LeftStr(LS4.Caption,LastDelimiter('(',LS4.Caption)-2);
    if LS4.Tag = 0 then LS4.Visible:=False;
    LS5.DragMode:=dmManual;
    LS5.Caption:=LeftStr(LS5.Caption,LastDelimiter('(',LS5.Caption)-2);
    if LS5.Tag = 0 then LS5.Visible:=False;
    LS6.DragMode:=dmManual;
    LS6.Caption:=LeftStr(LS6.Caption,LastDelimiter('(',LS6.Caption)-2);
    if LS6.Tag = 0 then LS6.Visible:=False;
    LS7.DragMode:=dmManual;
    LS7.Caption:=LeftStr(LS7.Caption,LastDelimiter('(',LS7.Caption)-2);
    if LS7.Tag = 0 then LS7.Visible:=False;
    LS8.DragMode:=dmManual;
    LS8.Caption:=LeftStr(LS8.Caption,LastDelimiter('(',LS8.Caption)-2);
    if LS8.Tag = 0 then LS8.Visible:=False;
    LS9.DragMode:=dmManual;
    LS9.Caption:=LeftStr(LS9.Caption,LastDelimiter('(',LS9.Caption)-2);
    if LS9.Tag = 0 then LS9.Visible:=False;
    LS10.DragMode:=dmManual;
    LS10.Caption:=LeftStr(LS10.Caption,LastDelimiter('(',LS10.Caption)-2);
    if LS10.Tag = 0 then LS10.Visible:=False;
    LS11.DragMode:=dmManual;
    LS11.Caption:=LeftStr(LS11.Caption,LastDelimiter('(',LS11.Caption)-2);
    if LS11.Tag = 0 then LS11.Visible:=False;
    LS12.DragMode:=dmManual;
    LS12.Caption:=LeftStr(LS12.Caption,LastDelimiter('(',LS12.Caption)-2);
    if LS12.Tag = 0 then LS12.Visible:=False;
    LS13.DragMode:=dmManual;
    LS13.Caption:=LeftStr(LS13.Caption,LastDelimiter('(',LS13.Caption)-2);
    if LS13.Tag = 0 then LS13.Visible:=False;
    LS14.DragMode:=dmManual;
    LS14.Caption:=LeftStr(LS14.Caption,LastDelimiter('(',LS14.Caption)-2);
    if LS14.Tag = 0 then LS14.Visible:=False;
    LS15.DragMode:=dmManual;
    LS15.Caption:=LeftStr(LS15.Caption,LastDelimiter('(',LS15.Caption)-2);
    if LS15.Tag = 0 then LS15.Visible:=False;
    LS16.DragMode:=dmManual;
    LS16.Caption:=LeftStr(LS16.Caption,LastDelimiter('(',LS16.Caption)-2);
    if LS16.Tag = 0 then LS16.Visible:=False;
    LA1.DragMode:=dmManual;
    LA1.Caption:=LeftStr(LA1.Caption,LastDelimiter('(',LA1.Caption)-2);
    if LA1.Tag = 0 then LA1.Visible:=False;
    LA2.DragMode:=dmManual;
    LA2.Caption:=LeftStr(LA2.Caption,LastDelimiter('(',LA2.Caption)-2);
    if LA2.Tag = 0 then LA2.Visible:=False;
    LA3.DragMode:=dmManual;
    LA3.Caption:=LeftStr(LA3.Caption,LastDelimiter('(',LA3.Caption)-2);
    if LA3.Tag = 0 then LA3.Visible:=False;
    LA4.DragMode:=dmManual;
    LA4.Caption:=LeftStr(LA4.Caption,LastDelimiter('(',LA4.Caption)-2);
    if LA4.Tag = 0 then LA4.Visible:=False;
    LA5.DragMode:=dmManual;
    LA5.Caption:=LeftStr(LA5.Caption,LastDelimiter('(',LA5.Caption)-2);
    if LA5.Tag = 0 then LA5.Visible:=False;
    LA6.DragMode:=dmManual;
    LA6.Caption:=LeftStr(LA6.Caption,LastDelimiter('(',LA6.Caption)-2);
    if LA6.Tag = 0 then LA6.Visible:=False;
    LA7.DragMode:=dmManual;
    LA7.Caption:=LeftStr(LA7.Caption,LastDelimiter('(',LA7.Caption)-2);
    if LA7.Tag = 0 then LA7.Visible:=False;
    LA8.DragMode:=dmManual;
    LA8.Caption:=LeftStr(LA8.Caption,LastDelimiter('(',LA8.Caption)-2);
    if LA8.Tag = 0 then LA8.Visible:=False;
    LA9.DragMode:=dmManual;
    LA9.Caption:=LeftStr(LA9.Caption,LastDelimiter('(',LA9.Caption)-2);
    if LA9.Tag = 0 then LA9.Visible:=False;
    LA10.DragMode:=dmManual;
    LA10.Caption:=LeftStr(LA10.Caption,LastDelimiter('(',LA10.Caption)-2);
    if LA10.Tag = 0 then LA10.Visible:=False;
    LA11.DragMode:=dmManual;
    LA11.Caption:=LeftStr(LA11.Caption,LastDelimiter('(',LA11.Caption)-2);
    if LA11.Tag = 0 then LA11.Visible:=False;
    LA12.DragMode:=dmManual;
    LA12.Caption:=LeftStr(LA12.Caption,LastDelimiter('(',LA12.Caption)-2);
    if LA12.Tag = 0 then LA12.Visible:=False;
    LA13.DragMode:=dmManual;
    LA13.Caption:=LeftStr(LA13.Caption,LastDelimiter('(',LA13.Caption)-2);
    if LA13.Tag = 0 then LA13.Visible:=False;
    LMomLstg1.DragMode:=dmManual;
    if LMomLstg1.Tag = 0 then LMomLstg1.Visible:=False;
    LMomLstg2.DragMode:=dmManual;
    if LMomLstg2.Tag = 0 then LMomLstg2.Visible:=False;
    LWMCounter1.DragMode:=dmManual;
    if LWMCounter1.Tag = 0 then LWMCounter1.Visible:=False;
    LWMCounter2.DragMode:=dmManual;
    if LWMCounter2.Tag = 0 then LWMCounter2.Visible:=False;
    LZeit.DragMode:=dmManual;
    if LZeit.Tag = 0 then LZeit.Visible:=False;
    Label1.DragMode:=dmManual;
    if Label1.Tag = 0 then Label1.Visible:=False;
    Label2.DragMode:=dmManual;
    if Label2.Tag = 0 then Label2.Visible:=False;
    Label3.DragMode:=dmManual;
    if Label3.Tag = 0 then Label3.Visible:=False;
    Label4.DragMode:=dmManual;
    if Label4.Tag = 0 then Label4.Visible:=False;
    Label5.DragMode:=dmManual;
    if Label5.Tag = 0 then Label5.Visible:=False;
  end;
end;

procedure TForm1.MenuItem_AboutClick(Sender: TObject);
begin
  MessageDlg('Copyright (c) 2010, 2011, 2012 by Holger Römer.'+#13+
              #13+'Web-Seite: d-logg-linux.roemix.eu'+#13+
              #13+'Project-Seite mit Quellcode:'+#13+
              #13+'https://developer.berlios.de/projects/linsol/',
             mtInformation, [mbOK], 0);
end;

procedure TForm1.MenuItem_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.RadioButton_IPClick(Sender: TObject);
begin
   Edit_IP.Enabled:=True;
   Edit_Port.Enabled:=True;
end;

procedure TForm1.Radio_manuellClick(Sender: TObject);
begin
  TrackBar_Zeit.Enabled:=False;
  StaticText_ZeitBis.Visible:=False;
  StaticText_Timer.Visible:=False;
end;

procedure TForm1.Radio_autoClick(Sender: TObject);
begin
  TrackBar_Zeit.Enabled:=True;
  StaticText_ZeitBis.Visible:=True;
  StaticText_Timer.Visible:=True;
  TrackBar_Zeit.Position:=ZeitAktualisierung;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if SolDat.AktuelleDatenLesen then
    Use_aktDaten();
  ZeitAktualisierung:=TrackBar_Zeit.Position;
  Timer1.Interval:=ZeitAktualisierung * 1000;
  StaticText_Timer.Caption:=IntToStr(ZeitAktualisierung)
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  ZeitAktualisierung:=ZeitAktualisierung - 1;
  if ZeitAktualisierung < 0 then
    StaticText_Timer.Caption:= '0'
  else
    StaticText_Timer.Caption:=IntToStr(ZeitAktualisierung);
end;

procedure TForm1.TrackBar_ZeitChange(Sender: TObject);
begin
  StaticText_Sekunden.Caption:=IntToStr(TrackBar_Zeit.Position);
  ZeitAktualisierung:=TrackBar_Zeit.Position;
  StaticText_Timer.Caption:=IntToStr(ZeitAktualisierung)
end;

procedure TForm1.Use_aktDaten();
begin
  LS1.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[0])+' °C';
  LS2.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[1])+' °C';
  LS3.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[2])+' °C';
  LS4.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[3])+' °C';
  LS5.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[4])+' °C';
  LS6.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[5])+' °C';
  LS7.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[6])+' °C';
  LS8.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[7])+' °C';
  LS9.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[8])+' °C';
  LS10.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[9])+' °C';
  LS11.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[10])+' °C';
  LS12.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[11])+' °C';
  LS13.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[12])+' °C';
  LS14.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[13])+' °C';
  LS15.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[14])+' °C';
  LS16.Caption:=FormatFloat('##0.##',SolDat.AktuelleDatenRecord[0].Sensoren[15])+' l/h';
  if SolDat.AktuelleDatenRecord[0].Ausgaenge[0] then
     LA1.Caption:='ein'
  else
     LA1.Caption:='aus';
  if SolDat.AktuelleDatenRecord[0].Ausgaenge[1] then
      LA2.Caption:='ein'
  else
      LA2.Caption:='aus';
  if SolDat.AktuelleDatenRecord[0].Ausgaenge[2] then
      LA3.Caption:='ein'
  else
      LA3.Caption:='aus';
  if SolDat.AktuelleDatenRecord[0].Ausgaenge[3] then
     LA4.Caption:='ein'
  else
     LA4.Caption:='aus';
  if SolDat.AktuelleDatenRecord[0].Ausgaenge[4] then
     LA5.Caption:='ein'
  else
     LA5.Caption:='aus';
  if SolDat.AktuelleDatenRecord[0].Ausgaenge[5] then
     LA6.Caption:='ein'
  else
     LA6.Caption:='aus';
  if SolDat.AktuelleDatenRecord[0].Ausgaenge[6] then
     LA7.Caption:='ein'
  else
     LA7.Caption:='aus';
  if SolDat.AktuelleDatenRecord[0].Ausgaenge[7] then
     LA8.Caption:='ein'
  else
     LA8.Caption:='aus';
  if SolDat.AktuelleDatenRecord[0].Ausgaenge[8] then
     LA9.Caption:='ein'
  else
     LA9.Caption:='aus';
  if SolDat.AktuelleDatenRecord[0].Ausgaenge[9] then
     LA10.Caption:='ein'
  else
     LA10.Caption:='aus';
  if SolDat.AktuelleDatenRecord[0].Ausgaenge[10] then
     LA11.Caption:='ein'
  else
     LA11.Caption:='aus';
  if SolDat.AktuelleDatenRecord[0].Ausgaenge[11] then
     LA12.Caption:='ein'
  else
     LA12.Caption:='aus';
  if SolDat.AktuelleDatenRecord[0].Ausgaenge[12] then
      LA13.Caption:='aus'
  else
      LA13.Caption:='aus';

  if SolDat.AktuelleDatenRecord[0].Wmz1_aktiv then
     LMomLstg1.Caption:=FormatFloat('###,##0.##;-##0.##',SolDat.AktuelleDatenRecord[0].Lstg1)+' kWh'
  else
     LMomLstg1.Caption:='0 kWh';

  LWMCounter1.Caption:=FormatFloat('###,###',SolDat.AktuelleDatenRecord[0].mwh1)+
                       '.'+FormatFloat('###.##',SolDat.AktuelleDatenRecord[0].Kwh1)+' kWh';
  LZeit.Caption:=DateTimeToStr(SolDat.AktuelleDatenRecord[0].RDateTime);
end;

procedure TForm1.XMLPropStorage1RestoreProperties(Sender: TObject);
var
  HBild : string;
  i     : Integer;
begin
  HBild := XMLPropStorage1.StoredValue['item_HBild'];
  if (HBild <> '') then begin
    Image1.Picture.LoadFromFile(HBild);
    // Bildgroesse auf 640*480 begrenzen
    with Image1.Picture.Bitmap do begin
      Width:= 640;
      Height:= 480;
    end;
  end;
  RB_SpeicherTime.Checked:=StrToBool(XMLPropStorage1.StoredValue['RB_SpeicherTime']);
  RB_SpeicherKelvin.Checked:=StrToBool(XMLPropStorage1.StoredValue['RB_SpeicherKelvin']);

  if RB_SpeicherTime.Checked then begin
    CBox_SpeicherZeit.Enabled:=True;
    FloatSpin_Kelvin.Enabled:=False;
  end
  else begin
    FloatSpin_Kelvin.Enabled:=True;
    CBox_SpeicherZeit.Enabled:=False;
  end;

  for i:=0 to 15 do begin
    CheckGroupSensoren.Checked[i] := StrToBool(XMLPropStorage1.StoredValue['CB_S'+IntToStr(i+1)]);
  end;

  for i:=0 to 12 do begin
    CheckGroupAusgaenge.Checked[i] := StrToBool(XMLPropStorage1.StoredValue['CB_A'+IntToStr(i+1)]);
  end;

  ColorButton_S1.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S1']);
  ColorButton_S2.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S2']);
  ColorButton_S3.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S3']);
  ColorButton_S4.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S4']);
  ColorButton_S5.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S5']);
  ColorButton_S6.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S6']);
  ColorButton_S7.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S7']);
  ColorButton_S8.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S8']);
  ColorButton_S9.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S9']);
  ColorButton_S10.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S10']);
  ColorButton_S11.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S11']);
  ColorButton_S12.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S12']);
  ColorButton_S13.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S13']);
  ColorButton_S14.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S14']);
  ColorButton_S15.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S15']);
  ColorButton_S16.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_S16']);
  ColorButton_A1.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_A1']);
  ColorButton_A2.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_A2']);
  ColorButton_A3.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_A3']);
  ColorButton_A4.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_A4']);
  ColorButton_A5.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_A5']);
  ColorButton_A6.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_A6']);
  ColorButton_A7.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_A7']);
  ColorButton_A8.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_A8']);
  ColorButton_A9.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_A9']);
  ColorButton_A10.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_A10']);
  ColorButton_A11.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_A11']);
  ColorButton_A12.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_A12']);
  ColorButton_A13.ButtonColor:= StrToInt(XMLPropStorage1.StoredValue['Color_A13']);
  Label_LogDatei.Caption:='Log-Dir: '+Edit_Verzeichnis.Caption;
end;

procedure TForm1.XMLPropStorage1SavingProperties(Sender: TObject);
var
  i       : Integer;
begin
  XMLPropStorage1.StoredValue['RB_SpeicherTime'] :=  BoolToStr(RB_SpeicherTime.Checked);
  XMLPropStorage1.StoredValue['RB_SpeicherKelvin'] := BoolToStr(RB_SpeicherKelvin.Checked);

  for i:=0 to 15 do begin
    XMLPropStorage1.StoredValue['CB_S'+IntToStr(i+1)] := BoolToStr(CheckGroupSensoren.Checked[i]);
  end;
  for i:=0 to 12 do begin
    XMLPropStorage1.StoredValue['CB_A'+IntToStr(i+1)] := BoolToStr(CheckGroupAusgaenge.Checked[i]);
  end;
  XMLPropStorage1.StoredValue['Color_S1']:= IntToStr(ColorButton_S1.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S2']:= IntToStr(ColorButton_S2.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S3']:= IntToStr(ColorButton_S3.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S4']:= IntToStr(ColorButton_S4.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S5']:= IntToStr(ColorButton_S5.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S6']:= IntToStr(ColorButton_S6.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S7']:= IntToStr(ColorButton_S7.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S8']:= IntToStr(ColorButton_S8.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S9']:= IntToStr(ColorButton_S9.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S10']:= IntToStr(ColorButton_S10.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S11']:= IntToStr(ColorButton_S11.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S12']:= IntToStr(ColorButton_S12.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S13']:= IntToStr(ColorButton_S13.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S14']:= IntToStr(ColorButton_S14.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S15']:= IntToStr(ColorButton_S15.ButtonColor);
  XMLPropStorage1.StoredValue['Color_S16']:= IntToStr(ColorButton_S16.ButtonColor);
  XMLPropStorage1.StoredValue['Color_A1']:= IntToStr(ColorButton_A1.ButtonColor);
  XMLPropStorage1.StoredValue['Color_A2']:= IntToStr(ColorButton_A2.ButtonColor);
  XMLPropStorage1.StoredValue['Color_A3']:= IntToStr(ColorButton_A3.ButtonColor);
  XMLPropStorage1.StoredValue['Color_A4']:= IntToStr(ColorButton_A4.ButtonColor);
  XMLPropStorage1.StoredValue['Color_A5']:= IntToStr(ColorButton_A5.ButtonColor);
  XMLPropStorage1.StoredValue['Color_A6']:= IntToStr(ColorButton_A6.ButtonColor);
  XMLPropStorage1.StoredValue['Color_A7']:= IntToStr(ColorButton_A7.ButtonColor);
  XMLPropStorage1.StoredValue['Color_A8']:= IntToStr(ColorButton_A8.ButtonColor);
  XMLPropStorage1.StoredValue['Color_A9']:= IntToStr(ColorButton_A9.ButtonColor);
  XMLPropStorage1.StoredValue['Color_A10']:= IntToStr(ColorButton_A10.ButtonColor);
  XMLPropStorage1.StoredValue['Color_A11']:= IntToStr(ColorButton_A11.ButtonColor);
  XMLPropStorage1.StoredValue['Color_A12']:= IntToStr(ColorButton_A12.ButtonColor);
  XMLPropStorage1.StoredValue['Color_A13']:= IntToStr(ColorButton_A13.ButtonColor);
end;

procedure TForm1.LineChartColor();
begin
  LineChartAusgArr[0].SeriesColor:=ColorButton_A1.ButtonColor;
  LineChartAusgArr[1].SeriesColor:=ColorButton_A2.ButtonColor;
  LineChartAusgArr[2].SeriesColor:=ColorButton_A3.ButtonColor;
  LineChartAusgArr[3].SeriesColor:=ColorButton_A4.ButtonColor;
  LineChartAusgArr[4].SeriesColor:=ColorButton_A5.ButtonColor;
  LineChartAusgArr[5].SeriesColor:=ColorButton_A6.ButtonColor;
  LineChartAusgArr[6].SeriesColor:=ColorButton_A7.ButtonColor;
  LineChartAusgArr[7].SeriesColor:=ColorButton_A8.ButtonColor;
  LineChartAusgArr[8].SeriesColor:=ColorButton_A9.ButtonColor;
  LineChartAusgArr[9].SeriesColor:=ColorButton_A10.ButtonColor;
  LineChartAusgArr[10].SeriesColor:=ColorButton_A11.ButtonColor;
  LineChartAusgArr[11].SeriesColor:=ColorButton_A12.ButtonColor;
  LineChartAusgArr[12].SeriesColor:=ColorButton_A13.ButtonColor;
  LineChartSensArr[0].SeriesColor:=ColorButton_S1.ButtonColor;
  LineChartSensArr[1].SeriesColor:=ColorButton_S2.ButtonColor;
  LineChartSensArr[2].SeriesColor:=ColorButton_S3.ButtonColor;
  LineChartSensArr[3].SeriesColor:=ColorButton_S4.ButtonColor;
  LineChartSensArr[4].SeriesColor:=ColorButton_S5.ButtonColor;
  LineChartSensArr[5].SeriesColor:=ColorButton_S6.ButtonColor;
  LineChartSensArr[6].SeriesColor:=ColorButton_S7.ButtonColor;
  LineChartSensArr[7].SeriesColor:=ColorButton_S8.ButtonColor;
  LineChartSensArr[8].SeriesColor:=ColorButton_S9.ButtonColor;
  LineChartSensArr[9].SeriesColor:=ColorButton_S10.ButtonColor;
  LineChartSensArr[10].SeriesColor:=ColorButton_S11.ButtonColor;
  LineChartSensArr[11].SeriesColor:=ColorButton_S12.ButtonColor;
  LineChartSensArr[12].SeriesColor:=ColorButton_S13.ButtonColor;
  LineChartSensArr[13].SeriesColor:=ColorButton_S14.ButtonColor;
  LineChartSensArr[14].SeriesColor:=ColorButton_S15.ButtonColor;
  LineChartSensArr[15].SeriesColor:=ColorButton_S16.ButtonColor;
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
  StringGrid1.Cells[i,0]:='Std';
  i:=i+1;
  StringGrid1.Cells[i,0]:='Min';
  i:=i+1;
  StringGrid1.Cells[i,0]:='Sek';
  for j:=1 to 13 do begin
    i:=i+1;
    StringGrid1.Cells[i,0]:='A'+IntToStr(j);
  end;
  i:=i+1;
  StringGrid1.Cells[i,0]:='DrZSt 1';
  i:=i+1;
  StringGrid1.Cells[i,0]:='DrZSt 2';
  i:=i+1;
  StringGrid1.Cells[i,0]:='DrZSt 6';
  i:=i+1;
  StringGrid1.Cells[i,0]:='DrZSt 7';
  for j:=1 to 16 do begin
    i:=i+1;
    StringGrid1.Cells[i,0]:='S'+IntToStr(j);
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

procedure TForm1.CheckGroupAusgaengeItemClick(Sender: TObject; Index: integer);
begin
  LineChartColor();
  if CheckGroupAusgaenge.Checked[Index] then begin
    case Index of
      0 : ColorButton_A1.Enabled:=True;
      1 : ColorButton_A2.Enabled:=True;
      2 : ColorButton_A3.Enabled:=True;
      3 : ColorButton_A4.Enabled:=True;
      4 : ColorButton_A5.Enabled:=True;
      5 : ColorButton_A6.Enabled:=True;
      6 : ColorButton_A7.Enabled:=True;
      7 : ColorButton_A8.Enabled:=True;
      8 : ColorButton_A9.Enabled:=True;
      9 : ColorButton_A10.Enabled:=True;
      10 : ColorButton_A11.Enabled:=True;
      11 : ColorButton_A12.Enabled:=True;
      12 : ColorButton_A13.Enabled:=True;
      otherwise exit
    end;
    LineChartAusgArr[Index].Active:=True;
  end
  else begin
    case Index of
      0 : ColorButton_A1.Enabled:=False;
      1 : ColorButton_A2.Enabled:=False;
      2 : ColorButton_A3.Enabled:=False;
      3 : ColorButton_A4.Enabled:=False;
      4 : ColorButton_A5.Enabled:=False;
      5 : ColorButton_A6.Enabled:=False;
      6 : ColorButton_A7.Enabled:=False;
      7 : ColorButton_A8.Enabled:=False;
      8 : ColorButton_A9.Enabled:=False;
      9 : ColorButton_A10.Enabled:=False;
      10 : ColorButton_A11.Enabled:=False;
      11 : ColorButton_A12.Enabled:=False;
      12 : ColorButton_A13.Enabled:=False;
      otherwise exit
    end;
    LineChartAusgArr[Index].Active:=False;
  end;
end;

procedure TForm1.Button_tab_save_as_csvClick(Sender: TObject);
var
  Dir     : String;
begin
  Dir:=IncludeTrailingPathDelimiter(SolDat.LogDatenDir);
  StringGrid1.SaveToCSVFile(Dir+FormatDateTime('yyyymm',now)+'.csv',';');
end;

procedure TForm1.Button_TagMinusClick(Sender: TObject);
begin
  //  Prüfen, das der Tag nicht vor dem Start_Tag liegt
  if DateEdit_Start.Date < DateEdit_Einzeltag.Date then begin
    DateEdit_Einzeltag.Date:=IncDay(DateEdit_Einzeltag.Date,-1);
    DateEdit_Einzeltag.Tag:=1;
  end;
  if DateEdit_Start.Date >= DateEdit_Einzeltag.Date then
    Button_TagMinus.Enabled:=False;
  Daten_anzeigen_Einzeltag(DateEdit_Einzeltag.Date);
  Button_TagPlus.Enabled:=True;
  Button_alleDaten.Enabled:=True;
end;

procedure TForm1.Button_TagPlusClick(Sender: TObject);
begin
  //  Prüfen, das der Tag nicht nach dem Ende_Tag liegt
  if DateEdit_Ende.Date > DateEdit_Einzeltag.Date then begin
    DateEdit_Einzeltag.Date:=IncDay(DateEdit_Einzeltag.Date,1);
    DateEdit_Einzeltag.Tag:=1;
  end;
  if DateEdit_Ende.Date <= DateEdit_Einzeltag.Date then
    Button_TagPlus.Enabled:=False;
  Daten_anzeigen_Einzeltag(DateEdit_Einzeltag.Date);
  Button_TagMinus.Enabled:=True;
  Button_alleDaten.Enabled:=True;
end;

procedure TForm1.ChartToolset1DataPointHintTool1Hint(ATool: TDataPointHintTool;
  const APoint: TPoint; var AHint: String);
var
  y: Double;
  series: TChartSeries;
begin
  series := TChartSeries(ATool.Series);
  if series <> nil then begin
    y := series.Listsource.Item[ATool.PointIndex]^.Y;
    AHint := Format('%s Temperatur: %f °C', [series.Title, y]);
  end;
end;

procedure TForm1.Button_SetSpeicherkriteriumClick(Sender: TObject);
var
  tmp     : Integer;
begin
  SolDat.BLNetIPAdresse:=Edit_IP.Text;
  SolDat.BLNetPort:=StrToInt(Edit_Port.Text);
  if RB_SpeicherTime.Checked then begin
    tmp := StrToInt(LeftStr(CBox_SpeicherZeit.Text,2))*60 + StrToInt(RightStr(CBox_SpeicherZeit.Text,2));
    SolDat.LogIvallMinute:=tmp;
  end;

  if RB_SpeicherKelvin.Checked then begin
    SolDat.LogIvallKelvin:=Single(FloatSpin_Kelvin.Value);
  end;
  SolDat.SetLogIvall:=True;
  if SolDat.SetLogIvall then
    ShowMessage('Neues Log-Intervall erfolgreich gesetzt.')
  else
    ShowMessage('Log-Intervall nicht gesetzt!');
end;

procedure TForm1.Button_ModultypeClick(Sender: TObject);
begin
  SolDat.BLNetIPAdresse:=Edit_IP.Text;
  SolDat.BLNetPort:=StrToInt(Edit_Port.Text);
  Edit_Modultyp.Text:=SolDat.ModulTyp;
end;

procedure TForm1.Benamung_Form_Sensoren(Sender: TObject);
var
  aLabel1 : Array [0..15] of TLabel;
  i, y, z : Integer;
begin
  Form_Sensoren.Panel1.Free;
  Form_Sensoren.Panel1:=TPanel.Create(Self);
  Form_Sensoren.Panel1.Parent:=Form_Sensoren;
  Form_Sensoren.Panel1.Top:=0;
  Form_Sensoren.Panel1.Left:=0;
  y:=0;
  for i:=0 to 15 do begin
      aLabel1[y]:=TLabel.Create(Form_Sensoren.Panel1);
      with aLabel1[y] do begin
        aLabel1[y].Parent:=Form_Sensoren.Panel1;
        aLabel1[y].Font.Color:=LineChartSensArr[i].SeriesColor;
        aLabel1[y].Left:=10;
//        aLabel1[y].Top:=10+(aLabel1[y].Height * y);
        aLabel1[y].Name:='Sensor'+IntToStr(y+1);
      end;
      y := y +1 ;
    end;
  aLabel1[0].Caption:=ColorButton_S1.Caption;
  aLabel1[0].Width:=ColorButton_S1.Width;
  aLabel1[1].Caption:=ColorButton_S2.Caption;
  aLabel1[1].Width:=ColorButton_S2.Width;
  aLabel1[2].Caption:=ColorButton_S3.Caption;
  aLabel1[2].Width:=ColorButton_S3.Width;
  aLabel1[3].Caption:=ColorButton_S4.Caption;
  aLabel1[3].Width:=ColorButton_S4.Width;
  aLabel1[4].Caption:=ColorButton_S5.Caption;
  aLabel1[4].Width:=ColorButton_S5.Width;
  aLabel1[5].Caption:=ColorButton_S6.Caption;
  aLabel1[5].Width:=ColorButton_S6.Width;
  aLabel1[6].Caption:=ColorButton_S7.Caption;
  aLabel1[6].Width:=ColorButton_S7.Width;
  aLabel1[7].Caption:=ColorButton_S8.Caption;
  aLabel1[7].Width:=ColorButton_S8.Width;
  aLabel1[8].Caption:=ColorButton_S9.Caption;
  aLabel1[8].Width:=ColorButton_S9.Width;
  aLabel1[9].Caption:=ColorButton_S10.Caption;
  aLabel1[9].Width:=ColorButton_S10.Width;
  aLabel1[10].Caption:=ColorButton_S11.Caption;
  aLabel1[10].Width:=ColorButton_S11.Width;
  aLabel1[11].Caption:=ColorButton_S12.Caption;
  aLabel1[11].Width:=ColorButton_S12.Width;
  aLabel1[12].Caption:=ColorButton_S13.Caption;
  aLabel1[12].Width:=ColorButton_S13.Width;
  aLabel1[13].Caption:=ColorButton_S14.Caption;
  aLabel1[13].Width:=ColorButton_S14.Width;
  aLabel1[14].Caption:=ColorButton_S15.Caption;
  aLabel1[14].Width:=ColorButton_S15.Width;
  aLabel1[15].Caption:=ColorButton_S16.Caption;
  aLabel1[15].Width:=ColorButton_S16.Width;
  y:=aLabel1[0].Width;
  z:=0;
  for i:=0 to 15 do begin
    if not CheckGroupSensoren.Checked[i] then begin
      aLabel1[i].Enabled:=False;
      aLabel1[i].Visible:=False;
    end
    else begin
      aLabel1[i].Top:=10+(aLabel1[z].Height * z);
      z:=z+1;
      if y < aLabel1[i].Width then
        y:=aLabel1[i].Width
    end;
  end;
  Form_Sensoren.Width:=y +1 ;
  Form_Sensoren.Height:=aLabel1[0].Height * z + 20;
  Form_Sensoren.Panel1.Width:=Form_Sensoren.Width;
  Form_Sensoren.Panel1.Height:=Form_Sensoren.Height;
end;

procedure TForm1.Button_GetSpeicherkriteriumClick(Sender: TObject);
var
  intervall : Integer;
  fspinKelvin : Double;
begin
  SolDat.BLNetIPAdresse:=Edit_IP.Text;
  SolDat.BLNetPort:=StrToInt(Edit_Port.Text);
  intervall:=SolDat.GetLogIvall;
  //(10 * K)   oder  (128 +  Sekunden/20)
  //Temperaturdiff. [in 1/10K]    (5 - 120)
  //Zeitintervall [in 20 sec]     (129 - 248)
  if intervall = 0 then begin
    ShowMessage('Auslesen Speicherkriterium erst ab BL-Net-Firmware 2.14!');
    Exit;
  end;

  if intervall > 128 then begin
    CBox_SpeicherZeit.ItemIndex:=(((intervall-128) * 20) div 20) - 1;
    RB_SpeicherTime.Checked:=True;
  end
  else begin
    fspinKelvin:=intervall / 10;
    FloatSpin_Kelvin.Value:=fspinKelvin;
    RB_SpeicherKelvin.Checked:=True;
  end;
end;

procedure TForm1.Button_ModulModusClick(Sender: TObject);
begin
  SolDat.BLNetIPAdresse:=Edit_IP.Text;
  SolDat.BLNetPort:=StrToInt(Edit_Port.Text);
  Edit_ModulModus.Text:=SolDat.ModulModus;
end;

procedure TForm1.ChartToolset1ZoomDragTool1AfterMouseDown(ATool: TChartTool;
  APoint: TPoint);
begin
  ChartExtentLink1.Enabled:=True;
end;

procedure TForm1.Chart_LstgAxisList1MarkToText(var AText: String; AMark: Double
  );
begin
// AText:='Test';
// AMark:=1;
end;

procedure TForm1.CheckGroupSensorenItemClick(Sender: TObject; Index: integer);
begin
  LineChartColor();
  if CheckGroupSensoren.Checked[Index] then begin
    LineChartSensArr[Index].Active:=True;
    case Index of
      0 : ColorButton_S1.Enabled:=True;
      1 : ColorButton_S2.Enabled:=True;
      2 : ColorButton_S3.Enabled:=True;
      3 : ColorButton_S4.Enabled:=True;
      4 : ColorButton_S5.Enabled:=True;
      5 : ColorButton_S6.Enabled:=True;
      6 : ColorButton_S7.Enabled:=True;
      7 : ColorButton_S8.Enabled:=True;
      8 : ColorButton_S9.Enabled:=True;
      9 : ColorButton_S10.Enabled:=True;
      10 : ColorButton_S11.Enabled:=True;
      11 : ColorButton_S12.Enabled:=True;
      12 : ColorButton_S13.Enabled:=True;
      13 : ColorButton_S14.Enabled:=True;
      14 : ColorButton_S15.Enabled:=True;
      15 : ColorButton_S16.Enabled:=True;
      otherwise exit
    end;
  end
  else begin
    case Index of
      0 : ColorButton_S1.Enabled:=False;
      1 : ColorButton_S2.Enabled:=False;
      2 : ColorButton_S3.Enabled:=False;
      3 : ColorButton_S4.Enabled:=False;
      4 : ColorButton_S5.Enabled:=False;
      5 : ColorButton_S6.Enabled:=False;
      6 : ColorButton_S7.Enabled:=False;
      7 : ColorButton_S8.Enabled:=False;
      8 : ColorButton_S9.Enabled:=False;
      9 : ColorButton_S10.Enabled:=False;
      10 : ColorButton_S11.Enabled:=False;
      11 : ColorButton_S12.Enabled:=False;
      12 : ColorButton_S13.Enabled:=False;
      13 : ColorButton_S14.Enabled:=False;
      14 : ColorButton_S15.Enabled:=False;
      15 : ColorButton_S16.Enabled:=False;
      otherwise exit
    end;
    LineChartSensArr[Index].Active:=False;
  end;
end;

procedure TForm1.ColorButton_A10ColorChanged(Sender: TObject);
begin
  LineChartAusgArr[9].Active:=False;
  LineChartAusgArr[9].SeriesColor:=ColorButton_A10.ButtonColor;
  LineChartAusgArr[9].Active:=True;
end;

procedure TForm1.ColorButton_A11ColorChanged(Sender: TObject);
begin
  LineChartAusgArr[10].Active:=False;
  LineChartAusgArr[10].SeriesColor:=ColorButton_A11.ButtonColor;
  LineChartAusgArr[10].Active:=True;
end;

procedure TForm1.ColorButton_A12ColorChanged(Sender: TObject);
begin
  LineChartAusgArr[11].Active:=False;
  LineChartAusgArr[11].SeriesColor:=ColorButton_A12.ButtonColor;
  LineChartAusgArr[11].Active:=True;
end;

procedure TForm1.ColorButton_A13ColorChanged(Sender: TObject);
begin
  LineChartAusgArr[12].Active:=False;
  LineChartAusgArr[12].SeriesColor:=ColorButton_A13.ButtonColor;
  LineChartAusgArr[12].Active:=True;
end;

procedure TForm1.ColorButton_A1ColorChanged(Sender: TObject);
begin
  LineChartAusgArr[0].Active:=False;
  LineChartAusgArr[0].SeriesColor:=ColorButton_A1.ButtonColor;
  LineChartAusgArr[0].Active:=True;
end;

procedure TForm1.ColorButton_A2ColorChanged(Sender: TObject);
begin
  LineChartAusgArr[1].Active:=False;
  LineChartAusgArr[1].SeriesColor:=ColorButton_A2.ButtonColor;
  LineChartAusgArr[1].Active:=True;
end;

procedure TForm1.ColorButton_A3ColorChanged(Sender: TObject);
begin
  LineChartAusgArr[2].Active:=False;
  LineChartAusgArr[2].SeriesColor:=ColorButton_A3.ButtonColor;
  LineChartAusgArr[2].Active:=True;
end;

procedure TForm1.ColorButton_A4ColorChanged(Sender: TObject);
begin
  LineChartAusgArr[3].Active:=False;
  LineChartAusgArr[3].SeriesColor:=ColorButton_A4.ButtonColor;
  LineChartAusgArr[3].Active:=True;
end;

procedure TForm1.ColorButton_A5ColorChanged(Sender: TObject);
begin
  LineChartAusgArr[4].Active:=False;
  LineChartAusgArr[4].SeriesColor:=ColorButton_A5.ButtonColor;
  LineChartAusgArr[4].Active:=True;
end;

procedure TForm1.ColorButton_A6ColorChanged(Sender: TObject);
begin
  LineChartAusgArr[5].Active:=False;
  LineChartAusgArr[5].SeriesColor:=ColorButton_A6.ButtonColor;
  LineChartAusgArr[5].Active:=True;
end;

procedure TForm1.ColorButton_A7ColorChanged(Sender: TObject);
begin
  LineChartAusgArr[6].Active:=False;
  LineChartAusgArr[6].SeriesColor:=ColorButton_A7.ButtonColor;
  LineChartAusgArr[6].Active:=True;
end;

procedure TForm1.ColorButton_A8ColorChanged(Sender: TObject);
begin
  LineChartAusgArr[7].Active:=False;
  LineChartAusgArr[7].SeriesColor:=ColorButton_A8.ButtonColor;
  LineChartAusgArr[7].Active:=True;
end;

procedure TForm1.ColorButton_A9ColorChanged(Sender: TObject);
begin
  LineChartAusgArr[8].Active:=False;
  LineChartAusgArr[8].SeriesColor:=ColorButton_A9.ButtonColor;
  LineChartAusgArr[8].Active:=True;
end;

procedure TForm1.ColorButton_S10ColorChanged(Sender: TObject);
begin
  LineChartSensArr[9].Active:=False;
  LineChartSensArr[9].SeriesColor:=ColorButton_S10.ButtonColor;
  LineChartSensArr[9].Active:=True;
end;

procedure TForm1.ColorButton_S11ColorChanged(Sender: TObject);
begin
  LineChartSensArr[10].Active:=False;
  LineChartSensArr[10].SeriesColor:=ColorButton_S11.ButtonColor;
  LineChartSensArr[10].Active:=True;
end;

procedure TForm1.ColorButton_S12ColorChanged(Sender: TObject);
begin
  LineChartSensArr[11].Active:=False;
  LineChartSensArr[11].SeriesColor:=ColorButton_S12.ButtonColor;
  LineChartSensArr[11].Active:=True;
end;

procedure TForm1.ColorButton_S13ColorChanged(Sender: TObject);
begin
  LineChartSensArr[12].Active:=False;
  LineChartSensArr[12].SeriesColor:=ColorButton_S13.ButtonColor;
  LineChartSensArr[12].Active:=True;
end;

procedure TForm1.ColorButton_S14ColorChanged(Sender: TObject);
begin
  LineChartSensArr[13].Active:=False;
  LineChartSensArr[13].SeriesColor:=ColorButton_S14.ButtonColor;
  LineChartSensArr[13].Active:=True;
end;

procedure TForm1.ColorButton_S15ColorChanged(Sender: TObject);
begin
  LineChartSensArr[14].Active:=False;
  LineChartSensArr[14].SeriesColor:=ColorButton_S15.ButtonColor;
  LineChartSensArr[14].Active:=True;
end;

procedure TForm1.ColorButton_S16ColorChanged(Sender: TObject);
begin
  LineChartSensArr[15].Active:=False;
  LineChartSensArr[15].SeriesColor:=ColorButton_S16.ButtonColor;
  LineChartSensArr[15].Active:=True;
end;

procedure TForm1.ColorButton_S1ColorChanged(Sender: TObject);
begin
  LineChartSensArr[0].Active:=False;
  LineChartSensArr[0].SeriesColor:=ColorButton_S1.ButtonColor;
  LineChartSensArr[0].Active:=True;
end;

procedure TForm1.ColorButton_S2ColorChanged(Sender: TObject);
begin
  LineChartSensArr[1].Active:=False;
  LineChartSensArr[1].SeriesColor:=ColorButton_S2.ButtonColor;
  LineChartSensArr[1].Active:=True;
end;

procedure TForm1.ColorButton_S3ColorChanged(Sender: TObject);
begin
  LineChartSensArr[2].Active:=False;
  LineChartSensArr[2].SeriesColor:=ColorButton_S3.ButtonColor;
  LineChartSensArr[2].Active:=True;
end;

procedure TForm1.ColorButton_S4ColorChanged(Sender: TObject);
begin
  LineChartSensArr[3].Active:=False;
  LineChartSensArr[3].SeriesColor:=ColorButton_S4.ButtonColor;
  LineChartSensArr[3].Active:=True;
end;

procedure TForm1.ColorButton_S5ColorChanged(Sender: TObject);
begin
  LineChartSensArr[4].Active:=False;
  LineChartSensArr[4].SeriesColor:=ColorButton_S5.ButtonColor;
  LineChartSensArr[4].Active:=True;
end;

procedure TForm1.ColorButton_S6ColorChanged(Sender: TObject);
begin
  LineChartSensArr[5].Active:=False;
  LineChartSensArr[5].SeriesColor:=ColorButton_S6.ButtonColor;
  LineChartSensArr[5].Active:=True;
end;

procedure TForm1.ColorButton_S7ColorChanged(Sender: TObject);
begin
  LineChartSensArr[6].Active:=False;
  LineChartSensArr[6].SeriesColor:=ColorButton_S7.ButtonColor;
  LineChartSensArr[6].Active:=True;
end;

procedure TForm1.ColorButton_S8ColorChanged(Sender: TObject);
begin
  LineChartSensArr[7].Active:=False;
  LineChartSensArr[7].SeriesColor:=ColorButton_S8.ButtonColor;
  LineChartSensArr[7].Active:=True;
end;

procedure TForm1.ColorButton_S9ColorChanged(Sender: TObject);
begin
  LineChartSensArr[8].Active:=False;
  LineChartSensArr[8].SeriesColor:=ColorButton_S9.ButtonColor;
  LineChartSensArr[8].Active:=True;
end;

procedure TForm1.DateEdit_EinzeltagChange(Sender: TObject);
begin
  if DateEdit_Einzeltag.Enabled and (Not EinzelTagAcceptDay) then begin
    // Prüfen ob der Tag in der Range liegt!
      if (CompareDate(DateEdit_Einzeltag.Date,DateEdit_Start.Date) < 0) or
         (CompareDate(DateEdit_Einzeltag.Date,DateEdit_Ende.Date) > 0) then begin
           EinzelTag:=False;
           MessageDlg(DateToStr(DateEdit_Einzeltag.Date)+#13#10+'Datum ausserhalb der Zeitspanne!',mtError, [mbOK], 0);
       end
      else
        EinzelTag:=True;
  end;
 end;

procedure TForm1.DateEdit_EinzeltagClick(Sender: TObject);
begin
  DateEdit_Einzeltag.Tag:=1;
end;

procedure TForm1.DateEdit_EinzeltagCloseUp(Sender: TObject);
begin
  DateEdit_Einzeltag.Tag:=1;
  dt_tmp:=DateEdit_Einzeltag.Date;
  EinzelTagAcceptDay:=False;
  if EinzelTag then begin
    Daten_anzeigen_Einzeltag(DateEdit_Einzeltag.Date);
    Button_alleDaten.Enabled:=True;
    if (CompareDate(DateEdit_Einzeltag.Date,DateEdit_Start.Date) <= 0) then
      Button_TagMinus.Enabled:=False
    else
      Button_TagMinus.Enabled:=True;
    if (CompareDate(DateEdit_Einzeltag.Date,DateEdit_Ende.Date) >= 0) then
      Button_TagPlus.Enabled:=False
    else
      Button_TagPlus.Enabled:=True;
    end
  else
    DateEdit_Einzeltag.Date:=DateEdit_Start.Date;
end;

procedure TForm1.DateEdit_EinzeltagExit(Sender: TObject);
begin
  EinzelTagAcceptDay:=False;
  if EinzelTag then begin
    Daten_anzeigen_Einzeltag(DateEdit_Einzeltag.Date);
    if (CompareDate(DateEdit_Einzeltag.Date,DateEdit_Start.Date) <= 0) then
      Button_TagMinus.Enabled:=False
    else
      Button_TagMinus.Enabled:=True;
    if (CompareDate(DateEdit_Einzeltag.Date,DateEdit_Ende.Date) >= 0) then
      Button_TagPlus.Enabled:=False
    else
      Button_TagPlus.Enabled:=True;
    end
  else
    DateEdit_Einzeltag.Date:=DateEdit_Start.Date;
end;

procedure TForm1.DateEdit_EndeExit(Sender: TObject);
var
  test  : TDateTime;
begin
  if Not TryStrToDate(DateEdit_Ende.Text,test)  then begin
    MessageDlg('Falsche Eingabe des Datum: '+DateEdit_Ende.Text,mtError, [mbOK], 0);
    DateEdit_Ende.SetFocus;
  end;
end;

procedure TForm1.DateEdit_StartExit(Sender: TObject);
var
  test  : TDateTime;
begin
  if Not TryStrToDate(DateEdit_Start.Text,test)  then begin
    MessageDlg('Falsche Eingabe des Datum: '+DateEdit_Start.Text,mtError, [mbOK], 0);
    DateEdit_Start.SetFocus;
  end;
end;

procedure TForm1.Daten_anzeigen_Einzeltag(EinzelTag: TDate);
var
 i, k, anzahl, AusgangTmp           : Integer;
 Lstg1, merkLstg1, Lstg2, merkLstg2 : Single;
 Ausgang                            : TAusgang;
 dt, merkDay                        : TDateTime;
begin
  // LineChart:
  for k:=0 to 12 do begin
    LineChartAusgArr[k].Clear;
    if CheckGroupAusgaenge.Checked[k] then
      LineChartAusgArr[k].Active:=True
    else
      LineChartAusgArr[k].Active:=False;
  end;
  for k:=0 to 15 do begin
    LineChartSensArr[k].Clear;
    LineChartSensArr[k].LineType:=ltFromPrevious;
    if CheckGroupSensoren.Checked[k] then
      LineChartSensArr[k].Active:=True
    else
      LineChartSensArr[k].Active:=False;
  end;
//  BarChartLstg1.Clear;
//  BarChartLstg2.Clear;

  anzahl:=Length(SolDat.SolDatRecArray);
//  ShowMessage(DateTimeToStr(SolDat.SolDatRecArray[anzahl-2].RDateTime));
  for i:=0 to anzahl-1 do begin
    if SameDate(SolDat.SolDatRecArray[i].RDateTime,EinzelTag) then begin
        for k:=0 to 12 do begin
          if SolDat.SolDatRecArray[i].Ausgaenge[k] then
            AusgangTmp:=1
          else
            AusgangTmp:=0;
          LineChartAusgArr[k].AddXY(SolDat.SolDatRecArray[i].RDateTime,k*1.2+AusgangTmp);
        end;
        for k:=0 to 15 do begin
          LineChartSensArr[k].AddXY(SolDat.SolDatRecArray[i].RDateTime,SolDat.SolDatRecArray[i].Sensoren[k]);
        end;
      end;
  end;
  DateTimeIntervalChartSource_Lstg.DateTimeFormat:='DD.MM.';
  DateTimeIntervalChartSource1.DateTimeFormat:='hh:mm'+#13#10+'DD.MM.';
  Chart_Lstg.ZoomFull;
  ChartAusgaenge.ZoomFull;
  ChartSensoren.ZoomFull;
  MenuItem_GitterChartAusg.Enabled:=True;
  MenuItem_GitterChartSens_h.Enabled:=True;
  MenuItem_SensorFenster.Enabled:=True;
end;

procedure TForm1.Edit_VerzeichnisClick(Sender: TObject);
begin
  SelectDirectoryDialog1.FileName:=Edit_Verzeichnis.Text;
  if SelectDirectoryDialog1.Execute then
    Edit_Verzeichnis.Text:=SelectDirectoryDialog1.FileName;
  Button_Verzeichnis.Enabled:=True;
end;

procedure TForm1.ExtendedNotebook1Change(Sender: TObject);
begin
  if ExtendedNotebook1.ActivePageIndex = 1 then begin
    ChartToolset1ZoomDragTool1.Enabled:=False;
    ChartToolset1PanDragTool1.Enabled:=False;
  end
  else begin
    ChartToolset1ZoomDragTool1.Enabled:=True;
    ChartToolset1PanDragTool1.Enabled:=True;
  end;
  if ExtendedNotebook1.ActivePage.Name='Einstellungen' then begin
    Form_Sensoren.Close;
    MenuItem_SensorFenster.Tag:=0;
  end;
end;

procedure TForm1.GroupBox2Resize(Sender: TObject);
begin
  Label6.Left:=3;
  DateEdit_Start.Left:=Label6.Left + Label6.Width +3;
  Label7.Left:=DateEdit_Start.Left + DateEdit_Start.Width + 30;
  DateEdit_Ende.Left:=Label7.Left + Label7.Width + 3;
  Button_Daten_anzeigen.Left:=DateEdit_Ende.Left + DateEdit_Ende.Width + 30;
  GroupBox2.Width:=Button_Daten_anzeigen.Left + Button_Daten_anzeigen.Width + 8;
end;

procedure TForm1.GroupBox_AusgangFarbeResize(Sender: TObject);
var
  Abstand    : Integer;
begin
  Abstand:=GroupBox_AusgangFarbe.Height DIV 14;
  ColorButton_A1.Top:=Abstand DIV 2;
  ColorButton_A2.Top:=ColorButton_A1.Top + Abstand;
  ColorButton_A3.Top:=ColorButton_A2.Top + Abstand;
  ColorButton_A4.Top:=ColorButton_A3.Top + Abstand;
  ColorButton_A5.Top:=ColorButton_A4.Top + Abstand;
  ColorButton_A6.Top:=ColorButton_A5.Top + Abstand;
  ColorButton_A7.Top:=ColorButton_A6.Top + Abstand;
  ColorButton_A8.Top:=ColorButton_A7.Top + Abstand;
  ColorButton_A9.Top:=ColorButton_A8.Top + Abstand;
  ColorButton_A10.Top:=ColorButton_A9.Top + Abstand;
  ColorButton_A11.Top:=ColorButton_A10.Top + Abstand;
  ColorButton_A12.Top:=ColorButton_A11.Top + Abstand;
  ColorButton_A13.Top:=ColorButton_A12.Top + Abstand;
end;

procedure TForm1.GroupBox_DiagrammResize(Sender: TObject);
begin
  GroupBox_Diagramm.Width:=GroupBox_AusgangFarbe.Left+
                           GroupBox_AusgangFarbe.Width+10;
end;

procedure TForm1.GroupBox_SensorFarbeResize(Sender: TObject);
var
  Abstand    : Integer;
begin
  Abstand:=GroupBox_SensorFarbe.Height DIV 17;
  ColorButton_S1.Top:=Abstand DIV 2;
  ColorButton_S2.Top:=ColorButton_S1.Top + Abstand;
  ColorButton_S3.Top:=ColorButton_S2.Top + Abstand;
  ColorButton_S4.Top:=ColorButton_S3.Top + Abstand;
  ColorButton_S5.Top:=ColorButton_S4.Top + Abstand;
  ColorButton_S6.Top:=ColorButton_S5.Top + Abstand;
  ColorButton_S7.Top:=ColorButton_S6.Top + Abstand;
  ColorButton_S8.Top:=ColorButton_S7.Top + Abstand;
  ColorButton_S9.Top:=ColorButton_S8.Top + Abstand;
  ColorButton_S10.Top:=ColorButton_S9.Top + Abstand;
  ColorButton_S11.Top:=ColorButton_S10.Top + Abstand;
  ColorButton_S12.Top:=ColorButton_S11.Top + Abstand;
  ColorButton_S13.Top:=ColorButton_S12.Top + Abstand;
  ColorButton_S14.Top:=ColorButton_S13.Top + Abstand;
  ColorButton_S15.Top:=ColorButton_S14.Top + Abstand;
  ColorButton_S16.Top:=ColorButton_S15.Top + Abstand;
end;

procedure TForm1.GroupBox_SpKriteriumResize(Sender: TObject);
begin
  Button_GetSpeicherkriterium.Top:=FloatSpin_Kelvin.Top+FloatSpin_Kelvin.Height+5;
  Button_SetSpeicherkriterium.Top:=FloatSpin_Kelvin.Top+FloatSpin_Kelvin.Height+5;
  GroupBox_SpKriterium.Width:=Label9.Left+Label9.Width+8;
end;

procedure TForm1.Label1EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  Label1.Top := P.Y + Image1.Top - Label1.Height div 2 ;
  Label1.Left := P.X + Image1.Left;
  Label1.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    Label1.Top := P.Y + Image2.Top - Label1.Height div 2 ;
    Label1.Left := P.X + Image2.Left ;
    Label1.Tag:=0;
  end;
end;

procedure TForm1.Label2EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  Label2.Top := P.Y + Image1.Top - Label2.Height div 2 ;
  Label2.Left := P.X + Image1.Left;
  Label2.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    Label2.Top := P.Y + Image2.Top - Label2.Height div 2 ;
    Label2.Left := P.X + Image2.Left ;
    Label2.Tag:=0;
  end;
end;

procedure TForm1.Label3EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  Label3.Top := P.Y + Image1.Top - Label3.Height div 2 ;
  Label3.Left := P.X + Image1.Left;
  Label3.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    Label3.Top := P.Y + Image2.Top - Label3.Height div 2 ;
    Label3.Left := P.X + Image2.Left ;
    Label3.Tag:=0;
  end;
end;

procedure TForm1.Label4EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  Label4.Top := P.Y + Image1.Top - Label4.Height div 2 ;
  Label4.Left := P.X + Image1.Left;
  Label4.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    Label4.Top := P.Y + Image2.Top - Label4.Height div 2 ;
    Label4.Left := P.X + Image2.Left ;
    Label4.Tag:=0;
  end;
end;

procedure TForm1.Label5EndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  Label5.Top := P.Y + Image1.Top - Label5.Height div 2 ;
  Label5.Left := P.X + Image1.Left;
  Label5.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    Label5.Top := P.Y + Image2.Top - Label5.Height div 2 ;
    Label5.Left := P.X + Image2.Left ;
    Label5.Tag:=0;
  end;
end;

procedure TForm1.LZeitEndDrag(Sender, Target: TObject; X, Y: Integer);
var
   P: TPoint;
begin
  if (Target = Image1) then begin
  P := Image1.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
  LZeit.Top := P.Y + Image1.Top - LZeit.Height div 2 ;
  LZeit.Left := P.X + Image1.Left;
  LZeit.Tag:=1;
  end;
  if (Target = Image2) then begin
    P := Image2.ScreenToClient(Point(Mouse.CursorPos.X, Mouse.CursorPos.Y));
    LZeit.Top := P.Y + Image2.Top - LZeit.Height div 2 ;
    LZeit.Left := P.X + Image2.Left ;
    LZeit.Tag:=0;
  end;
end;

procedure TForm1.MenuItem_BeschriftungClick(Sender: TObject);
begin
//  ShowMessage(TColorButton(PopupMenuBeschriftung.PopupComponent).Name); // Caption);
  TColorButton(PopupMenuBeschriftung.PopupComponent).Caption:=InputBox(
  'Bezeichnung ändern','Sensor/Ausgang:',TColorButton(PopupMenuBeschriftung.PopupComponent).Caption);
end;

procedure TForm1.MenuItem_CrosshairClick(Sender: TObject);
begin
  if MenuItem_Crosshair.Tag = 0 then begin
    ChartToolset1DataPointCrosshairTool1.Enabled:=True;
    MenuItem_Crosshair.Tag:=1;
  end
  else begin
    ChartToolset1DataPointCrosshairTool1.Enabled:=False;
    MenuItem_Crosshair.Tag:=0;
  end;
end;

procedure TForm1.MenuItem_DatenwertClick(Sender: TObject);
begin
  if MenuItem_Datenwert.Tag = 0 then begin
    MenuItem_Datenwert.Checked:=True;
    ChartToolset1DataPointHintTool1.Enabled:=True;
    MenuItem_Datenwert.Tag := 1;
  end
  else begin
    MenuItem_Datenwert.Checked:=False;
    ChartToolset1DataPointHintTool1.Enabled:=False;
    MenuItem_Datenwert.Tag := 0;
  end;
end;

procedure TForm1.MenuItem_GitterChartAusgClick(Sender: TObject);
begin
  if MenuItem_GitterChartAusg.Tag = 0 then begin
    ChartAusgaenge.BottomAxis.Grid.Visible:=False;
    MenuItem_GitterChartAusg.Tag:=1;
  end
  else begin
    ChartAusgaenge.BottomAxis.Grid.Visible:=True;
    MenuItem_GitterChartAusg.Tag:=0;
  end;
end;

procedure TForm1.MenuItem_GitterChartSens_hClick(Sender: TObject);
begin
  if MenuItem_GitterChartSens_h.Tag = 0 then begin
    ChartSensoren.LeftAxis.Grid.Visible:=False;
//    ChartSensoren.BottomAxis.Grid.Visible:=False;
    MenuItem_GitterChartSens_h.Tag:=1;
  end
  else begin
    ChartSensoren.LeftAxis.Grid.Visible:=True;
//    ChartSensoren.BottomAxis.Grid.Visible:=True;
    MenuItem_GitterChartSens_h.Tag:=0;
  end;
end;

procedure TForm1.MenuItem_GitterChartSens_vClick(Sender: TObject);
begin
  if MenuItem_GitterChartSens_v.Tag = 0 then begin
//    ChartSensoren.LeftAxis.Grid.Visible:=False;
    ChartSensoren.BottomAxis.Grid.Visible:=False;
    MenuItem_GitterChartSens_v.Tag:=1;
  end
  else begin
//    ChartSensoren.LeftAxis.Grid.Visible:=True;
    ChartSensoren.BottomAxis.Grid.Visible:=True;
    MenuItem_GitterChartSens_v.Tag:=0;
  end;
end;

procedure TForm1.MenuItem_SensorFensterClick(Sender: TObject);
begin
  if MenuItem_SensorFenster.Tag = 0 then begin
    Benamung_Form_Sensoren(Self);
    MenuItem_SensorFenster.Tag:=1;
  end;
  Form_Sensoren.Top:=Mouse.CursorPos.y;
  Form_Sensoren.Left:=Mouse.CursorPos.x;
  Form_Sensoren.Visible:=True;
  Form_Sensoren.ShowOnTop;
end;

procedure TForm1.Radio_autoChange(Sender: TObject);
begin

end;

procedure TForm1.RB_SpeicherKelvinChange(Sender: TObject);
begin
  if RB_SpeicherKelvin.Tag = 0 then begin
    FloatSpin_Kelvin.Enabled:=True;
    CBox_SpeicherZeit.Enabled:=False;
  end
  else begin
    FloatSpin_Kelvin.Enabled:=False;
    CBox_SpeicherZeit.Enabled:=True;
  end;
end;

procedure TForm1.RB_SpeicherTimeChange(Sender: TObject);
begin
  if RB_SpeicherTime.Tag = 0 then begin
    FloatSpin_Kelvin.Enabled:=False;
    CBox_SpeicherZeit.Enabled:=True;
   end
  else begin
    FloatSpin_Kelvin.Enabled:=True;
    CBox_SpeicherZeit.Enabled:=False;
  end;
end;

initialization
  {$I unit1.lrs}

end.
