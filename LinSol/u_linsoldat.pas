{ Unit LinSolDat - Datenzugriff auf BL-Net sowie Logdateien im Winsol-Format

  Copyright (C) 2011,2012   H. Römer hr@roemix.eu

  This source is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2 of the License, or (at your option)
  any later version.

  This code is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web
  at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing
  to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
  MA 02111-1307, USA.
}
unit u_LinSolDat;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dateutils, lNet;
const
  C_MODULTYP             = $4800000000181020;
  C_MODULMODUS           = $81;
  C_FIRMWARE             = $82;
  C_BETRIEBSMODE         = $21;
  C_GETSPEICHERKRITERIUM = $95;
  C_SPEICHERKRITERIUM    = $96;
  C_KONFIGCANGET         = $97;
  C_KONFIGCANSET         = $98;
  C_KOPFSATZLESEN        = $AA;
  C_AKTUELLEDATENLESEN   = $AB;
  C_ENDELESEN            = $AD;
  C_RESETDATAFLASH       = $AF;
  C_DATENBEREICHLESEN    = $AC;
  C_UVR1611              : Byte = $07; // Controllertype; in Logdatei - Header Byte 7
  C_UVR61_3              : Byte = $06; // Controllertype; in Logdatei - Header Byte 7

type
  TControllerType = (ctUVR1611,ctUVR61_3);
  TWinsolRecordList = TFPList;

  { TSolConn }
  TSolConn = class
    private
      SolCon: TLTcp;
      procedure OnDs(aSocket: TLSocket);
      procedure OnRe(aSocket: TLSocket);
      procedure OnEr(const msg: String; aSocket: TLSocket);
    public
      constructor Create;
      destructor Destroy; override;
  end;

  { TSolDat }
  {$packset 1}
   TAusgang = (ta1,ta2,ta3,ta4,ta5,ta6,ta7,ta8,ta9,ta10,ta11,ta12,ta13,ta14,ta15,ta16);
   TAusgaenge = Set of TAusgang;

  PLogRecIn = ^TLogRecIn;
  TLogRecIn = Packed Record
//  TLogRecIn = Record
    tag       : Byte;
    std       : Byte;
    min       : Byte;
    sek       : Byte;
    Ausgaenge : Array [0..1] of Byte;
    dza1      : Byte;
    dza2      : Byte;
    dza6      : Byte;
    dza7      : Byte;
    Sensoren  : Array [0..15] of Word;//SmallInt;
    WmzFlag   : Byte;
    Wmz1      : Integer;
    Kwh1      : Word;
    mwh1      : Word;
    Wmz2      : Integer;
    Kwh2      : Word;
    mwh2      : Word;
  end;

  PLogRec = ^TLogRec;
  TLogRec = Packed Record
//  TLogRec = Record
    RDateTime  : TDateTime;
    leer       : Double;
    Sensoren   : Array [1..16] of Integer;//Single;
    Ausgaenge  : Array [1..13] of Boolean;
    dza1_aktiv : Boolean;
    dza1_stufe : SmallInt;
    dza2_aktiv : Boolean;
    dza2_stufe : SmallInt;
    dza6_aktiv : Boolean;
    dza6_stufe : SmallInt;
    dza7_aktiv : Boolean;
    dza7_stufe : SmallInt;
    Wmz1_aktiv : Boolean;
    Wmz2_aktiv : Boolean;
    Lstg1      : Single;
    Kwh1       : Single;
    mwh1       : Single;
    Lstg2      : Single;
    Kwh2       : Single;
    mwh2       : Single;
  end;

  TlogRecArray = Array [0..999999] of TLogRec; //Array of TLogRec;
//  PlogRecArray = ^TlogRecArray;

  PCANkonfig = ^TCANkonfig;
  TCANkonfig = Record
    AnzRahmen  : Byte;
    KnotenNr : Array[1..8] of Byte;
    RahmenNr : Array[1..8] of Byte;
  end;

  TSolDat = class(TObject)
  private
    BLConn        : TSolConn;
    FAktuelleDatenCAN: Integer;
    LogIvall      : Char;
//    AktDaten      : PLogRec;
    TCPSol        : TSolConn;
    SENS_Art: array[1..16] of Integer;
    SENS: array[1..16] of Integer;//Single; //float SENS[17];
    AUSG: array[1..13] of Integer;
    DZR: array[1..8] of Integer;
    DZStufe: array[1..8] of Integer;
    // Waermezaehler (float  Mlstg[3],W_kwh[3], W_Mwh[3];)
    // Das erste Element beginnt bei [1]
    Mlstg: array[1..2] of Single;
    W_kwh: array[1..2] of Single;
    W_Mwh: array[1..2] of Single;
    WMReg: array[1..2] of Integer; //int WMReg[3]
    akt_daten : Array[1..116] of Byte;
    uvr_typ2 : Byte;  // uvr_typ2 -> 2. Geraet bei 2DL
    datenrahmen, uvr_modus : Byte;

    LogArray  : TlogRecArray;
    FTCANkonfig : TCANkonfig;
    FBLNetIPAdresse : String;
    FBLNetPort      : Word;
    FBLNetUSBPort   : String;
    FDataFlashReset : Boolean;
    FLogDatenDir    : String;
    FLogIvallKelvin : Single;
    FLogIvallMinute : Integer;
    FSetLogIvall    : Boolean;
    UVR_Type        : Byte;
    IPAdresse       : String;
    USBPort         : String;
    IPPort          : Word;
    FW_Version      : Integer;
    LogArrayCount   : Integer;
    LogArrayAlles   : Boolean;

    Buffer     : Array [0..58] of Byte;
    jahr       : SmallInt;
    monat      : SmallInt;
    day        : SmallInt;
    std        : SmallInt;
    min        : SmallInt;
    sek        : SmallInt;
    Ausgaenge  : Array [1..13] of Boolean;
    dza1_aktiv : Boolean;
    dza1_stufe : SmallInt;
    dza2_aktiv : Boolean;
    dza2_stufe : SmallInt;
    dza6_aktiv : Boolean;
    dza6_stufe : SmallInt;
    dza7_aktiv : Boolean;
    dza7_stufe : SmallInt;
    Sensoren   : Array [1..16] of SmallInt;
    Wmz1_aktiv : Boolean;
    Wmz2_aktiv : Boolean;
    Lstg1      : Single;
    Kwh1       : Single;
    mwh1       : Single;
    Lstg2      : Single;
    Kwh2       : Single;
    mwh2       : Single;

    procedure SetAktuelleDatenCAN(AValue: Integer);
    procedure SetBLNetIPAdresse(const AValue: String);
    procedure SetBLNetPort(const AValue: Word);
    procedure SetBLNetUSBPort(const AValue: String);
    procedure SetLogDatenDir(AValue: String);
    procedure SetSetLogIvall(AValue: Boolean);
    procedure SetLogIvallMinute(AValue: Integer);
    procedure SetLogIvallKelvin(AValue: Single);
    procedure SetDataFlashReset(AValue: Boolean);
    procedure UVR1611_aktDaten(DSaetze: Integer);
    procedure UVR61_3_aktDaten(DSaetze: Integer);
    function  VerbindeBLNet: Boolean;
    function  Empfang: Boolean;
    function  GetFirmware:String;
    function  GetLogDaten: Boolean; // Ergebnis vom Daten holen
    function  GetModulModus: String;
    function  GetModulTyp: String;
    function  GetBetriebstyp: String;
    function  ReadLogIvall: Integer;
    procedure SetBetriebstyp(BTyp : String);
    procedure SetLogDaten(BLNetReset: Boolean);
    function  GetConfigCAN : TCANkonfig;
    procedure SetConfigCAN(CANRahmen :TCANkonfig);
    function  GetSolDat(Start, Ende : TDateTime): Boolean;
    function  GetAktuelleDaten:Boolean;

    procedure fuelleLogArray(Data:TLogRecIn; ArrayZeile:Integer);
    function TestBit(const Value: Word; const Bit: Byte): Boolean;
    function ClearBit(const Value: Word; const Bit: Byte): Word;
    function SetBit(const Value: Word; const Bit: Byte): Word;
    function EnableBit(const Value: Word; const Bit: Byte; const TurnOn: Boolean): Word;
    function check_pruefsumme: Integer;
    procedure check_kennung(received_Bytes:Integer);
    procedure berechne_werte(anz_regler:Integer);
    procedure temperaturanz(regler: Integer);
    procedure ausgaengeanz(regler: Integer);
    procedure drehzahlstufenanz(regler: Integer);
    procedure waermemengenanz(regler: Integer);
    function berechnetemp(lowbyte, highbyte: Byte; sensor: Integer): Integer; //Single;
    function berechnevol(lowbyte,highbyte: Byte):Integer; //Single;
    function eingangsparameter(highbyte: Byte): Integer;
  public
    function SetData(DataIn  : Array of Byte; Count :Integer):Boolean;
    property Firmware        : String read GetFirmware;
    property ModulModus      : String read GetModulModus;
    property ModulTyp        : String read GetModulTyp;
    property BetriebsModus   : String read GetBetriebstyp write SetBetriebstyp;
    property LogIvallMinute  : Integer read FLogIvallMinute write SetLogIvallMinute;
    property LogIvallKelvin  : Single read FLogIvallKelvin write SetLogIvallKelvin;
    property SetLogIvall     : Boolean read FSetLogIvall write SetSetLogIvall;
    property GetLogIvall     : Integer read ReadLogIvall;
    property ConfigCAN       : TCANkonfig read GetConfigCAN write SetConfigCAN;
    property BLNetIPAdresse  : String read FBLNetIPAdresse write SetBLNetIPAdresse;
    property BLNetPort       : Word read FBLNetPort write SetBLNetPort;
    property BLNetUSBPort    : String read FBLNetUSBPort write SetBLNetUSBPort;
    property SolDat[Start, Ende :TDateTime] : Boolean read GetSolDat;
    property SolDatRecArray  : TlogRecArray read LogArray;
    property SolDatRecCount  : Integer read LogArrayCount;
    property SolDatAlleDaten : Boolean read LogArrayAlles;
    property AktuelleDatenCAN : Integer read FAktuelleDatenCAN write SetAktuelleDatenCAN ;
    property AktuelleDatenLesen : Boolean read GetAktuelleDaten;
    property AktuelleDatenRecord: TlogRecArray read LogArray;
// property AktuelleDatenRecord: PLogRec read AktDaten;
    property LogDatenlesen   : Boolean read GetLogDaten write SetLogDaten;
    property DataFlashReset  : Boolean read FDataFlashReset write SetDataFlashReset;
    property LogDatenDir     : String read FLogDatenDir write SetLogDatenDir;
    constructor create;
  end;

  var
    EmpfangBuffer : PByte;
    OnReOk        : Boolean;
    AnzahlByteGelesen : Integer;
    DebugFile         : TextFile;

implementation

{ TSolConn }

procedure TSolConn.OnDs(aSocket: TLSocket);
begin

end;

procedure TSolConn.OnRe(aSocket: TLSocket);
var
  erg           : Integer;
begin
  erg:=SolCon.Get(EmpfangBuffer^,120);

  if erg > 0 then begin
    OnReOk:=True;
  end;
  AnzahlByteGelesen:=erg;
end;

procedure TSolConn.OnEr(const msg: String; aSocket: TLSocket);
begin

end;

constructor TSolConn.Create;
begin
  SolCon := TLTCP.Create(nil);
  SolCon.OnError := @OnEr;
  SolCon.OnReceive := @OnRe;
  SolCon.OnDisconnect := @OnDs;
  SolCon.Timeout := 900; //100;
end;

destructor TSolConn.Destroy;
begin
  SolCon.Free;
  inherited Destroy;
end;

{ TSolDat }

// Daten aus Log-Datei lesen
function TSolDat.GetSolDat(Start, Ende: TDateTime): Boolean;
var
  FJahr, FMonat, i,anzDS  : Integer;
  EJahr, EMonat           : Integer;
  AnzahlElementeLogArray  : Integer;
  AnzahlDSLogDatei        : Integer;
  FileSize                : Integer;
  FLogFile                : TFileStream;
  FileName, Dir           : String;
  Header                  : Array [0..58] of byte;
  TempDaten               : TSolDat;
  FType                   : TControllerType;
  TempDate                : TDateTime;
  DataRec   : PLogRecIn;     // kompletter Datensatz mit Datum zur Auswertung
  FDebugFile             : TFileStream;
begin
 // +++ Debugg
  //AssignFile(DebugFile,'Debug.out');
  //Rewrite(DebugFile);
  //FDebugFile := TFileStream.Create('Debug.hex',fmCreate);
 // +++
 LogArrayAlles:=True;
 Result:=False;
  if FLogDatenDir = '' then
    Dir:=IncludeTrailingPathDelimiter(GetCurrentDir)
  else
    Dir:=IncludeTrailingPathDelimiter(FLogDatenDir);

  FJahr:=YearOf(Start);
  FMonat:=MonthOf(Start);
  EJahr:=YearOf(Ende);
  EMonat:=MonthOf(Ende);
  if TimeOf(Ende) = 0 then
    Ende:=RecodeTime(Ende,23,59,59,0);
  i:=0;
  LogArrayCount:=0;
  New(DataRec);
//  SetLength(LogArray,0);
  while ((FJahr = EJahr) and (FMonat <= EMonat)) or (FJahr < EJahr)  do begin
    FileName:=Dir+'Y'+ IntToStr(FJahr) + Format('%.2d',[FMonat])+'.log';
    AnzahlElementeLogArray:=Length(LogArray);

    if FileExists(FileName) then begin
      FLogFile := TFileStream.Create(FileName,fmOpenRead+fmShareDenyWrite);
      FLogFile.ReadBuffer(Header,sizeof(Header));
      TempDaten:= TSolDat.Create;
      TempDaten.SetData(Header,sizeof(Header));
      FileSize:=FLogFile.Size;
      AnzahlDSLogDatei:=FileSize div sizeof(Header);
      //if AnzahlElementeLogArray = 0 then
      //  AnzahlElementeLogArray:= AnzahlElementeLogArray + AnzahlDSLogDatei
      //else
      //  AnzahlElementeLogArray:= AnzahlElementeLogArray + AnzahlDSLogDatei - 1;

//      SetLength(LogArray,AnzahlElementeLogArray ); //- 1);
      // +++ Debug
//        WriteLn(DebugFile,'Length(LogArray): '+IntToStr(Length(LogArray)));

      if Header[7] = C_UVR1611 then begin
        FType := ctUVR1611;
      end
      else if Header[7] = C_UVR61_3 then begin
        FType := ctUVR61_3;
      end;
      anzDS:=0;
      try
        while FLogFile.Position < FLogFile.Size do begin
          if FType = ctUVR1611 then begin
            FLogFile.ReadBuffer(DataRec^.tag,SizeOf(TLogRecIn));  //59);
            // +++ Debug
  //            FDebugFile.WriteBuffer(DataRec^,59);
            TempDate:=EncodeDateTime(FJahr,FMonat,DataRec^.tag,DataRec^.std,
                      DataRec^.min,DataRec^.sek,0);
            if (TempDate >= Start) and (TempDate <= Ende) then begin
               LogArray[i].RDateTime:=TempDate;
               fuelleLogArray(DataRec^, i);
               anzDS:=anzDS+1;
               i:= i+1;
               // +++ Debug
//               WriteLn(DebugFile,'anzDS: '+IntToStr(anzDS)+' i: '+IntToStr(i));
            end;
          end;
          if i >= Length(LogArray) then begin
             LogArrayAlles:=False;
            break;
          end;
        end;
      finally
      end;
      FLogFile.Free;
      Result:=True;
    end;
//    SetLength(LogArray,i);
    if FMonat < 12 then
       FMonat:=FMonat+1
    else begin
       FMonat:=1;
       FJahr:=FJahr+1;
    end;
    if i >= Length(LogArray) then
      break;
  end;
  TempDaten.Free;
  LogArrayCount:=i;
  // +++ Debug
  //FDebugFile.Free;
  //WriteLn(DebugFile,'Length(LogArray): '+IntToStr(Length(LogArray)));
  //WriteLn(DebugFile,'LogArrayCount: '+IntToStr(LogArrayCount));
  //CloseFile(DebugFile);
  // +++ Debug

end;

// Teste, ob ein bestimmtes Bit 0 oder 1 ist
function TSolDat.TestBit(const Value: Word; const Bit: Byte): Boolean;
begin
 Result := (Value and (1 shl Bit)) <> 0;
end;

procedure TSolDat.SetBLNetIPAdresse(const AValue: String);
begin
  if FBLNetIPAdresse=AValue then exit;
  FBLNetIPAdresse:=AValue;
end;

procedure TSolDat.SetAktuelleDatenCAN(AValue: Integer);
begin
  if FAktuelleDatenCAN=AValue then exit;
  FAktuelleDatenCAN:=AValue;
end;

procedure TSolDat.SetBLNetPort(const AValue: Word);
begin
  if FBLNetPort=AValue then exit;
  FBLNetPort:=AValue;
end;

procedure TSolDat.SetBLNetUSBPort(const AValue: String);
begin
  if FBLNetUSBPort=AValue then exit;
  FBLNetUSBPort:=AValue;
end;

procedure TSolDat.SetLogDatenDir(AValue: String);
begin
  if FLogDatenDir=AValue then exit;
  FLogDatenDir:=AValue;
end;

procedure TSolDat.SetSetLogIvall(AValue: Boolean);
var
  sendbyte      : Array [0..1] of Byte;
  erg           : Integer;
begin
  FSetLogIvall:=False;
  if LogIvall = 'x' then
    exit;

  if UpperCase(LogIvall) = 'Z' then
    sendbyte[1]:= FLogIvallMinute;

  if UpperCase(LogIvall) = 'T' then begin
    sendbyte[1]:=StrToInt(FloatToStr(FLogIvallKelvin));
  end;

  erg:=0;

  if NOT VerbindeBLNet then begin
    Exit;
  end;

  sendbyte[0]:=C_MODULMODUS;
  EmpfangBuffer[0]:=$0;
  erg:=TCPSol.SolCon.Send(sendbyte,1);
  if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
    TCPSol.SolCon.Disconnect();
    TCPSol.Free;
    exit;
  end;

  sendbyte[0]:=C_SPEICHERKRITERIUM;
  EmpfangBuffer[0]:=$0;

  erg:=TCPSol.SolCon.Send(sendbyte,2);
  if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
    TCPSol.SolCon.Disconnect();
    TCPSol.Free;
    exit;
  end;
  if EmpfangBuffer[0] = sendbyte[1] then
    FSetLogIvall:=true;

  TCPSol.SolCon.Disconnect();
  TCPSol.Free;
end;

// Speicherkriterium in Sekunden; default: 20 Sekunden
procedure TSolDat.SetLogIvallMinute(AValue: Integer);
begin
  if FLogIvallMinute=AValue then exit;
  if (AValue > 2400) or (AValue < 20) then
    FLogIvallMinute:=20
  else
    FLogIvallMinute:= (AValue div 20) + 128;
  LogIvall:='Z';
end;

// Speicherkriterium in Kelvin; default: 2,5 K
procedure TSolDat.SetLogIvallKelvin(AValue: Single);
begin
  if FLogIvallKelvin=AValue then exit;
  if (AValue > 12) or (AValue < 0.5) then
    FLogIvallKelvin:=2.5
  else
    FLogIvallKelvin:=AValue*10;
  LogIvall:='T';
end;

// Soll der Data Flash zurückgesetzt werden
procedure TSolDat.SetDataFlashReset(AValue: Boolean);
begin
  if FDataFlashReset=AValue then exit;
  FDataFlashReset:=AValue;
end;

// Loesche ein bestimmtes Bit
function TSolDat.ClearBit(const Value: Word; const Bit: Byte): Word;
begin
 Result := Value and not (1 shl Bit);
end;

// Setze ein bestimmtes Bit
function TSolDat.SetBit(const Value: Word; const Bit: Byte): Word;
begin
 Result := Value or (1 shl Bit);
end;

function TSolDat.EnableBit(const Value: Word; const Bit: Byte;
  const TurnOn: Boolean): Word;
begin
 Result := (Value or (1 shl Bit)) xor (Integer(not TurnOn) shl Bit);
end;

// /* Pruefsumme berechnen und kontrollieren */
function TSolDat.check_pruefsumme: Integer;
var
  i : Integer;
  anzByte_uvr1 : Integer = 0;
  anzByte_uvr2 : Integer = 0;
  pruefz_ok : Integer = 1;
  pruefz_read : Byte = 0;
  pruefz : Byte = 0;
begin
  UVR_Type := akt_daten[0];
  case UVR_Type of
    $80: anzByte_uvr1 := 55; // UVR1611
    $90: anzByte_uvr1 := 26; // UVR61-3
  end;
  if uvr_modus = $A8 then begin  // Modus 1 DL
    for i:=0 to anzByte_uvr1 do begin
      pruefz := pruefz + akt_daten[i];
    end;
    if (pruefz mod $100) <> akt_daten[anzByte_uvr1 + 1] then begin
      pruefz_ok:=0;
      pruefz_read := akt_daten[anzByte_uvr1 + 1];
    end;
  end;

  if uvr_modus = $D1 then begin // Modus 2 DL
    uvr_typ2 := akt_daten[anzByte_uvr1+1]; // Welcher Typ an DL 2 ?
    case uvr_typ2 of
      $80: anzByte_uvr2 := 55; // UVR1611
      $90: anzByte_uvr2 := 26; // UVR61-3
    end;
    for i:=0 to (anzByte_uvr1 + 1 + anzByte_uvr2) do
      pruefz := pruefz + akt_daten[i];
    if (pruefz mod $100) <> akt_daten[anzByte_uvr1 + anzByte_uvr2 + 2] then  begin
      pruefz_ok:=0;
      pruefz_read := akt_daten[56];
    end;
  end;

  Result:=pruefz_ok;
end;

// /* Check auf Uebereinstimmung von Kennung und Anzahl gelesener Bytes */
procedure TSolDat.check_kennung(received_Bytes: Integer);
begin
  if (akt_daten[0] = $AB) then
    exit;

  // /* In Abhaengigkeit des Modus muss eine entsprechende Anzahl */
  // /* von Bytes gelesen worden sein -> sonst fehlerhaftes Datenlesen */
  // /* akt_daten[0] = 0x0; -> keine UVR(1611/61-3) -> keine Weiterverabeitung! */
  if (uvr_modus = $D1) then begin
    if (akt_daten[0] = $80) then begin // UVR1611
      if (received_Bytes <> 113) AND (received_Bytes <> 84) then begin
        akt_daten[0]:=$0;
        exit;
      end;
    end;
    if (akt_daten[0] = $90) then begin // UVR61_3
      if (received_Bytes <> 84) AND (received_Bytes <> 55) then begin
        akt_daten[0]:=$0;
        exit
      end;
    end;
  end;

  if (uvr_modus = $A8) then begin
    if (akt_daten[0] = $80) then begin // UVR1611
      if (received_Bytes <> 57) then begin
        akt_daten[0]:=$0;
        exit;
      end;
    end;
    if (akt_daten[0] = $90) then begin  // UVR61_3
      if (received_Bytes <> 28) then begin
        akt_daten[0]:=$0;
        exit;
      end;
    end;
  end;
end;

//* Aufruf der Funktionen zur Berechnung der Werte */
procedure TSolDat.berechne_werte(anz_regler: Integer);
var
  i, j : Integer;
  anz_bytes_1 : Integer = 0;
  anz_bytes_2 : Integer = 0;
begin
   // /* anz_regler = 1 : nur ein Regler vorhanden oder der erste Regler bei 0xD1 */
    if anz_regler = 2 then begin
      i := 0;
      case EmpfangBuffer[0] of
        $80: anz_bytes_1 := 56; // /* UVR1611 */
        $90: anz_bytes_1 := 27; // /* UVR61-3 */
        end;

      case EmpfangBuffer[anz_bytes_1] of
        $80: anz_bytes_2 := 56; // /* UVR1611 */
        $90: anz_bytes_2 := 27; // /* UVR61-3 */
        end;

      i := 0;
      for j:=anz_bytes_1 to (anz_bytes_1+anz_bytes_2) do begin
        EmpfangBuffer[i] := EmpfangBuffer[j];
        i:= i+1;
      end;

      EmpfangBuffer[i]:=$0; // /* mit /000 abschliessen!! */
    end;

    temperaturanz(anz_regler);
    ausgaengeanz(anz_regler);
    drehzahlstufenanz(anz_regler);
    waermemengenanz(anz_regler);
end;

// /* Bearbeitung der Temperatur-Sensoren */
procedure TSolDat.temperaturanz(regler: Integer);
var
  i, j : Integer;
  anzSensoren : Integer = 16;
  temp_uvr_typ : Byte = 0;
begin
  temp_uvr_typ:=UVR_Type;
  for i:=0 to anzSensoren do
    SENS_Art[i]:=0;

  if (regler = 2) then // /* 2. Geraet vorhanden */
    UVR_Type := uvr_typ2;

  case UVR_Type of
     $80: anzSensoren := 16; // /* UVR1611 */
     $90: anzSensoren := 6; // /* UVR61-3 */
    end;

  // /* vor berechnetemp() die oberen 4 Bit des HighByte auswerten!!!! */
  // /* Wichtig fuer Minus-Temp. */
  j:=1;
  for i:=0 to anzSensoren-1 do begin
      SENS_Art[i] := eingangsparameter(EmpfangBuffer[j+1]);
      case SENS_Art[i] of
         0, 1: SENS[i] := 0;
//         1: SENS[i] := 0; // digit. Pegel (AUS)
         2: SENS[i] := berechnetemp(EmpfangBuffer[j],EmpfangBuffer[j+1],SENS_Art[i]); // Temp.
         3: SENS[i] := berechnevol(EmpfangBuffer[j],EmpfangBuffer[j+1]);
         6: SENS[i] := berechnetemp(EmpfangBuffer[j],EmpfangBuffer[j+1],SENS_Art[i]); // Strahlung
         7: SENS[i] := berechnetemp(EmpfangBuffer[j],EmpfangBuffer[j+1],SENS_Art[i]); // Raumtemp.
         9: SENS[i] := 1; // digit. Pegel (EIN)
         10: SENS[i] := berechnetemp(EmpfangBuffer[j],EmpfangBuffer[j+1],SENS_Art[i]); // Minus-Temperaturen
         15: SENS[i] := berechnetemp(EmpfangBuffer[j],EmpfangBuffer[j+1],SENS_Art[i]); // Minus-Raumtemp.
         end;
      j:=j+2;
      end;
  UVR_Type:=temp_uvr_typ;
end;

// /* Bearbeitung der Ausgaenge */
procedure TSolDat.ausgaengeanz(regler: Integer);
var
  z : Integer;
  temp_uvr_typ : Byte =0;
begin
  //  int ausgaenge[13];
  // Ausgnge 2byte: low vor high
  // Bitbelegung:
  // AAAA AAAA
  // xxxA AAAA
  //  x ... dont care
  // A ... Ausgang (von low nach high zu nummerieren)

  temp_uvr_typ:=UVR_Type;

  for z:=0 to 13 do
    AUSG[z] := 0;

  if (regler = 2) then // /* 2. Geraet vorhanden */
    UVR_Type := uvr_typ2;

  if (UVR_Type = $80) then begin // /* UVR1611 */
    // /* Ausgaenge belegt? */
    for z:=1 to 8 do begin
        if testbit( EmpfangBuffer[33], z-1 )  then begin
          AUSG[z] := 1;
        end
        else begin
          AUSG[z] := 0;
        end;
    end;
    for z:=1 to 5 do begin
      if testbit( EmpfangBuffer[34], z-1 ) then begin
        AUSG[z+8] := 1;
      end
      else begin
        AUSG[z+8] := 0;
      end;
    end;
  end
  else if (UVR_Type = $90) then begin // /* UVR61-3 */
    for z:=1 to 3 do begin
      if testbit( EmpfangBuffer[13], z-1 ) then begin
        AUSG[z] := 1;
      end
      else begin
        AUSG[z] := 0;
     end;
    end;
  end;

  UVR_Type:=temp_uvr_typ;
end;

// /* Bearbeitung Drehzahlstufen */
procedure TSolDat.drehzahlstufenanz(regler: Integer);
var
  temp_uvr_typ : Byte =0;
begin
  temp_uvr_typ:=UVR_Type;

  if (regler = 2) then // /* 2. Geraet vorhanden */
    UVR_Type := uvr_typ2;
  if (UVR_Type = $80) then begin // /* UVR1611 */
      if ( ((EmpfangBuffer[35] and $80) = 0 ) AND (EmpfangBuffer[35] <> 0 ) ) then begin // /* ist das hochwertigste Bit gesetzt ? */
        DZR[1] := 1;
        DZStufe[1] := EmpfangBuffer[35] and $1F; // /* die drei hochwertigsten Bits loeschen */
      end
      else begin
        DZR[1] := 0;
        DZStufe[1] := 0;
      end;
      if ( ((EmpfangBuffer[36] and $80) = 0 )  AND (EmpfangBuffer[36] <> 0 ) ) then begin // /* ist das hochwertigste Bit gesetzt ? */
        DZR[2] := 1;
        DZStufe[2] := EmpfangBuffer[36] and $1F; // /* die drei hochwertigsten Bits loeschen */
      end
      else begin
        DZR[2] := 0;
        DZStufe[2] := 0;
      end;
      if ( ((EmpfangBuffer[37] and $80) = 0 )  AND (EmpfangBuffer[37] <> 0 ) ) then begin // /* ist das hochwertigste Bit gesetzt ? */
        DZR[6] := 1;
        DZStufe[6] := EmpfangBuffer[37] and $1F; // /* die drei hochwertigsten Bits loeschen */
      end
      else begin
        DZR[6] := 0;
        DZStufe[6] := 0;
      end;
      if (EmpfangBuffer[38] <> $80 ) then begin // /* angepasst: bei UVR1611 ist die Pumpe aus! */
        DZR[7] := 1;
        DZStufe[7] := EmpfangBuffer[38] and $1F; // /* die drei hochwertigsten Bits loeschen */
      end
      else begin
        DZR[7] := 0;
        DZStufe[7] := 0;
      end;
  end
    else if (UVR_Type = $90) then begin // /* UVR61-3 */
    if ( ((EmpfangBuffer[14] and $90) = 0 ) AND (EmpfangBuffer[14] <> 0 ) ) then begin // /* ist das hochwertigste Bit gesetzt ? */
      DZR[1] := 1;
      DZStufe[1] := EmpfangBuffer[14] and $1F; // /* die drei hochwertigsten Bits loeschen */
      end
    else begin
      DZR[1] := 0;
      DZStufe[1] := 0;
      end;
  end;
  UVR_Type:=temp_uvr_typ;
end;

// /* Bearbeitung Waermemengen-Register und -Zaehler */
procedure TSolDat.waermemengenanz(regler: Integer);
var
  tmp_wert : Integer;
  temp_uvr_typ : Byte = 0;
begin
    //  float momentLstg1, kwh1, mwh1, momentLstg2, kwh2, mwh2;
    WMReg[1] := 0;
    WMReg[2] := 0;
    temp_uvr_typ:=UVR_Type;

    if (regler = 2) then // /* 2. Geraet vorhanden */
      UVR_Type := uvr_typ2;

    if (UVR_Type = $80) then begin // /* UVR1611 */
      case EmpfangBuffer[39] of
         1: WMReg[1] := 1; // /* Waermemengenzaehler1 */
         2: WMReg[2] := 1; // /* Waermemengenzaehler2 */
         3: begin
            WMReg[1] := 1;  // /* Waermemengenzaehler1 */
            WMReg[2] := 1;  // /* Waermemengenzaehler2 */
         end;
      end;

      if WMReg[1] = 1 then begin
        if ( EmpfangBuffer[43] > $7f ) then begin// /* negtive Wete */
          tmp_wert := Integer((10*((65536*Single(EmpfangBuffer[43])+256*Single(EmpfangBuffer[42])+Single(EmpfangBuffer[41]))-65536)-(Single(EmpfangBuffer[40])*10)/256));
          tmp_wert := tmp_wert or $ffff0000;
          Mlstg[1] := tmp_wert / 100;
        end
        else begin
          Mlstg[1] := (10*(65536*Single(EmpfangBuffer[43])+256*Single(EmpfangBuffer[42])+Single(EmpfangBuffer[41]))+(Single(EmpfangBuffer[40])*10)/256)/100;
        end;
        W_kwh[1] := ( Single(EmpfangBuffer[45])*256 + Single(EmpfangBuffer[44]) )/10;
        W_Mwh[1] := (EmpfangBuffer[47]*$100 + EmpfangBuffer[46]);
      end;
      if (WMReg[2] = 1) then begin
        if ( EmpfangBuffer[51] > $7f )  then begin // /* negtive Wete */
          tmp_wert := Integer((10*((65536*Single(EmpfangBuffer[51])+256*Single(EmpfangBuffer[50])+Single(EmpfangBuffer[49]))-65536)-(Single(EmpfangBuffer[48])*10)/256));
          tmp_wert := tmp_wert or $ffff0000;
          Mlstg[2] := tmp_wert / 100;
        end
        else begin
          Mlstg[2] := (10*(65536*Single(EmpfangBuffer[51])+256*Single(EmpfangBuffer[50])+Single(EmpfangBuffer[49]))+(Single(EmpfangBuffer[48])*10)/256)/100;
        end;
        W_kwh[2] := (Single(EmpfangBuffer[53])*256 + Single(EmpfangBuffer[52]))/10;
        W_Mwh[2] := (EmpfangBuffer[55]*$100 + EmpfangBuffer[54]);
      end;
    end;

    if (UVR_Type = $90) then begin // /* UVR61-3 */
      if (EmpfangBuffer[16] = 1) then // /* ( tstbit(EmpfangBuffer[16],0) == 1)  EmpfangBuffer[17] und EmpfangBuffer[18] sind Volumenstrom */
        WMReg[1] := 1;
      if (WMReg[1] = 1) then begin
        Mlstg[1] := (256*Single(EmpfangBuffer[20])+Single(EmpfangBuffer[19]))/10;
        W_kwh[1] := ( Single(EmpfangBuffer[22])*256 + Single(EmpfangBuffer[21]) )/10;
        W_Mwh[1] := EmpfangBuffer[26]*$1000000 + EmpfangBuffer[25]*$10000 + EmpfangBuffer[24]*$100 + EmpfangBuffer[23];
      end;
    end;
    UVR_Type:=temp_uvr_typ;
end;

// /* Berechne die Temperatur / Strahlung */
function TSolDat.berechnetemp(lowbyte, highbyte: Byte; sensor: Integer
  ): Integer; // Single;
var
  temp_highbyte : Byte;
  z,wert : Integer;
//  wert : Word;
begin
    temp_highbyte := highbyte;
    wert := lowbyte or ((highbyte and $0f)<<8);

    if( (highbyte and $80) <> 0 ) then begin
        wert := wert xor $fff;
        wert := -wert -1 ;
        Result:=wert DIV 10;
//        Result:=(Single(wert / 10));
    end
    else begin
        if( sensor = 7) then begin // Raumtemperatur
          if( (highbyte and $01) <> 0 ) then begin
//            Result:=Single((256 + (lowbyte)) / 10); // /* Temperatur in C */
            Result:=(256 + lowbyte) DIV 10; // /* Temperatur in C */
          end
          else
            Result:=lowbyte DIV 10; // /* Temperatur in C */
        end
        else begin
          for z:=5 to 8 do
            temp_highbyte:=ClearBit(temp_highbyte,z-1);
            //temp_highbyte := temp_highbyte and ~(1 << z); // /* die oberen 4 Bit auf 0 setzen */

          if (sensor = 6) then begin
            Result:=temp_highbyte*256 + lowbyte; // /* Strahlung in W/m2 */
//            Result:=Single(((temp_highbyte)*256) + lowbyte); // /* Strahlung in W/m2 */
          end
          else
            Result:=(temp_highbyte*256 + lowbyte) DIV 10; // /* Temperatur in C */
        end;
      end;
end;

// /* Berechne Volumenstrom */
function TSolDat.berechnevol(lowbyte, highbyte: Byte): Integer; //Single;
  var
    temp_highbyte : Byte;
    z, wert : Integer;
//    wert : Word;
begin
      temp_highbyte := highbyte;
      wert := lowbyte or ((highbyte and $0f)<<8);

        //  if( (highbyte & UVR1611) != 0 )
        if( (highbyte and $80) = 0 ) then begin // /* Volumenstrom kann nicht negativ sein*/
            for z:=5 to 8 do
              temp_highbyte:=ClearBit(temp_highbyte,z-1);
//              temp_highbyte := temp_highbyte and ~(1 << z); // /* die oberen 4 Bit auf 0 setzen */

            wert := (lowbyte or ((temp_highbyte and $0f)<<8)) * 4;
            Result:=wert ;
//            Result:=Single(wert) ;
        end
        else
            Result:=0; // /* Volumenstrom in l/h */
end;

// /* Ermittle die Art des Eingangsparameters */
function TSolDat.eingangsparameter(highbyte: Byte): Integer;
var
  bitbyte: Integer = 0;
begin
  //    Eingänge 2 byte,  low vor high
  //    Bitbelegung:
  //    TTTT TTTT
  //    VEEE TTTT
  //    T ... Eingangswert
  //    V ... Vorzeichen (1=Minus)
  //    E ... Type (Einheit) des Eingangsparameters:
  //    x000 xxxx  Eingang unbenutzt
  //    D001 xxxx  digitaler Pegel (Bit D)
  //    V010 TTTT  Temperatur (in 1/10 C)
  //    V011 TTTT  Volumenstrom (in 4 l/h)
  //    V110 TTTT  Strahlung (in 1 W/m)
  //    V111 xRRT  Temp. Raumsensor(in 1/10 C)

  if testbit(highbyte,4) then
    bitbyte:=setbit(bitbyte,0);

  if testbit(highbyte,5) then
    bitbyte:=setbit(bitbyte,1);

  if testbit(highbyte,6) then
    bitbyte:=setbit(bitbyte,2);

  if testbit(highbyte,7) then
    bitbyte:=setbit(bitbyte,3);

  Result := bitbyte;
end;

// aktuelle Daten von der UVR 1611
procedure TSolDat.UVR1611_aktDaten(DSaetze: Integer);
var
  i        : Integer;
//  AktDaten : PLogRec;
begin
// New(DataRec);
//******************************************************************************************************************************
// SetLength(LogArray,2);
 if DSaetze = 1 then begin
   LogArrayCount:=1;
    UVR_Type:=EmpfangBuffer[0];
    berechne_werte(1);
    for i:=0 to 12 do begin
        if AUSG[i+1] = 1 then
          LogArray[0].Ausgaenge[i]:=True
        else
        LogArray[0].Ausgaenge[i]:=False;
    end;
    for i:=0 to 15 do
      LogArray[0].Sensoren[i]:=SENS[i];
    if DZR[1]=1 then
      LogArray[0].dza1_aktiv:=True
    else
      LogArray[0].dza1_aktiv:=False;
    LogArray[0].dza1_stufe:=DZStufe[1];
    if DZR[2]=1 then
      LogArray[0].dza2_aktiv:=True
    else
      LogArray[0].dza2_aktiv:=False;
    LogArray[0].dza2_stufe:=DZStufe[2];
    if DZR[6]=1 then
      LogArray[0].dza6_aktiv:=True
    else
      LogArray[0].dza6_aktiv:=False;
    LogArray[0].dza6_stufe:=DZStufe[6];
    if DZR[7]=1 then
      LogArray[0].dza7_aktiv:=True
    else
      LogArray[0].dza7_aktiv:=False;
    LogArray[0].dza7_stufe:=DZStufe[7];
    if WMReg[1]=1 then begin
      LogArray[0].Wmz1_aktiv:=True;
      LogArray[0].Lstg1:=Mlstg[1];
      LogArray[0].Kwh1:=W_kwh[1];
      LogArray[0].mwh1:=W_Mwh[1];
    end
    else begin
      LogArray[0].Wmz1_aktiv:=False;
      LogArray[0].Lstg1:=0;
      LogArray[0].Kwh1:=0;
      LogArray[0].mwh1:=0;
    end;
    if WMReg[2]=1 then begin
      LogArray[0].Wmz2_aktiv:=True;
      LogArray[0].Lstg2:=Mlstg[2];
      LogArray[0].Kwh2:=W_kwh[2];
      LogArray[0].mwh2:=W_Mwh[2];
    end
    else begin
      LogArray[0].Wmz2_aktiv:=False;
      LogArray[0].Lstg2:=0;
      LogArray[0].Kwh2:=0;
      LogArray[0].mwh2:=0;
    end;
    LogArray[0].RDateTime:=now;
  end;
 if DSaetze = 2 then begin
   LogArrayCount:=2;
    UVR_Type:=EmpfangBuffer[0];
    berechne_werte(2);
    for i:=0 to 12 do begin
        if AUSG[i+1] = 1 then
          LogArray[1].Ausgaenge[i]:=True
        else
        LogArray[1].Ausgaenge[i]:=False;
    end;
    for i:=0 to 15 do
      LogArray[1].Sensoren[i]:=SENS[i];
    if DZR[1]=1 then
      LogArray[1].dza1_aktiv:=True
    else
      LogArray[1].dza1_aktiv:=False;
    LogArray[1].dza1_stufe:=DZStufe[1];
    if DZR[2]=1 then
      LogArray[1].dza2_aktiv:=True
    else
      LogArray[1].dza2_aktiv:=False;
    LogArray[1].dza2_stufe:=DZStufe[2];
    if DZR[6]=1 then
      LogArray[1].dza6_aktiv:=True
    else
      LogArray[1].dza6_aktiv:=False;
    LogArray[1].dza6_stufe:=DZStufe[6];
    if DZR[7]=1 then
      LogArray[1].dza7_aktiv:=True
    else
      LogArray[1].dza7_aktiv:=False;
    LogArray[1].dza7_stufe:=DZStufe[7];
    if WMReg[1]=1 then begin
      LogArray[1].Wmz1_aktiv:=True;
      LogArray[1].Lstg1:=Mlstg[1];
      LogArray[1].Kwh1:=W_kwh[1];
      LogArray[1].mwh1:=W_Mwh[1];
    end
    else begin
      LogArray[1].Wmz1_aktiv:=False;
      LogArray[1].Lstg1:=0;
      LogArray[1].Kwh1:=0;
      LogArray[1].mwh1:=0;
    end;
    if WMReg[2]=1 then begin
      LogArray[1].Wmz2_aktiv:=True;
      LogArray[1].Lstg2:=Mlstg[2];
      LogArray[1].Kwh2:=W_kwh[2];
      LogArray[1].mwh2:=W_Mwh[2];
    end
    else begin
      LogArray[1].Wmz2_aktiv:=False;
      LogArray[1].Lstg2:=0;
      LogArray[1].Kwh2:=0;
      LogArray[1].mwh2:=0;
    end;
    LogArray[1].RDateTime:=now;
  end;
end;

// aktuelle Daten von der UVR 61-3
procedure TSolDat.UVR61_3_aktDaten(DSaetze: Integer);
begin
  if DSaetze = 1 then begin
    berechne_werte(1);
  end;

end;

function TSolDat.VerbindeBLNet: Boolean;
begin
 Result:=False;
 TCPSol:=TSolConn.Create;
 if TCPSol.SolCon.Connect(FBLNetIPAdresse,FBLNetPort) then begin // if connect went ok
   repeat
     TCPSol.SolCon.CallAction; // wait for "OnConnect"
   until TCPSol.SolCon.Connected;
   Result:=True;
 end;

end;

function TSolDat.Empfang: Boolean;
var
  Start         : TDateTime;
  abbruch       : Boolean;
begin
 abbruch:=false;
 Start:=Now;
 repeat
   TCPSol.SolCon.CallAction;  // wait for "OnReceive"
   if OnReOk then begin
     abbruch:=true;
     Result:=True;
   end;
   if SecondsBetween(Now,Start) > 2 then begin
     abbruch:=True; // max. 2 Sekunden warten
     Result:=False;
   end;
 until abbruch;
 OnReOk:=False;
 abbruch:=False;
end;

function TSolDat.GetFirmware: String;
var
  sendbyte      : Integer;
  erg           : Integer;
  Start         : TDateTime;
begin
  erg:=0;
  sendbyte:=C_FIRMWARE;
  EmpfangBuffer[0]:=$0;

  if NOT VerbindeBLNet then begin
    Result:='Verbindungsfehler';
    Exit;
  end;
  erg:=TCPSol.SolCon.Send(sendbyte,1);
  if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
    TCPSol.SolCon.Disconnect();
    TCPSol.Free;
    exit;
  end;
  TCPSol.SolCon.Disconnect();
  TCPSol.Free;
  FW_Version:=EmpfangBuffer[0];
  DefaultFormatSettings.DecimalSeparator:='.';
  Result:=FloatToStr(FW_Version/100);
  DefaultFormatSettings.DecimalSeparator:=',';
end;

// Log-Daten vom BL-Net lesen
function TSolDat.GetLogDaten: Boolean;
var
  sendbyte      : Array of Integer;
  erg           : Integer;
  empfangbyte   : Byte;
begin
 erg:=0;
 sendbyte[0]:=C_MODULMODUS;
 EmpfangBuffer[0]:=$0;

 if NOT VerbindeBLNet then begin
   Result:=False;
   Exit;
 end;
 erg:=TCPSol.SolCon.Send(sendbyte,1);
 if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
    TCPSol.SolCon.Disconnect();
    TCPSol.Free;
    Result:=False;
    exit;
 end;

end;

function TSolDat.GetModulModus: String;
var
  sendbyte      : Integer;
  erg, i        : Integer;
begin
  i:=0;
  erg:=0;
  sendbyte:=C_MODULMODUS;
  EmpfangBuffer[0]:=$0;

  if NOT VerbindeBLNet then begin
    Result:='Verbindungsfehler';
    Exit;
  end;

  erg:=TCPSol.SolCon.Send(sendbyte,1);
  if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
    TCPSol.SolCon.Disconnect();
    TCPSol.Free;
    exit;
  end;
  Result:=IntToStr(EmpfangBuffer[0]);
  case EmpfangBuffer[0] of
        $A8:  // 1 DL- Modus
          Result:='Datenlogging D1';
        $D1:  // 2 DL- Modus
          Result:='Datenlogging D2';
        $DC: // CAN-Logging
          Result:='Datenlogging CAN';
        $A2:
          Result:='Datensicherung (BL232)';
  end;

  TCPSol.SolCon.Disconnect();
  TCPSol.Free;
end;

function TSolDat.GetModulTyp: String;
var
  sendbytes     : Int64;
  erg, tmp      : Integer;
begin
  sendbytes:=C_MODULTYP;
  erg:=0;
  EmpfangBuffer[0]:=$0;
  EmpfangBuffer[1]:=$0;

  if NOT VerbindeBLNet then begin
    Result:='Verbindungsfehler';
    Exit;
  end;
  erg:=TCPSol.SolCon.Send(sendbytes,8);
  if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
    TCPSol.SolCon.Disconnect();
    TCPSol.Free;
    exit;
  end;

  TCPSol.SolCon.Disconnect();
  TCPSol.Free;

  if (EmpfangBuffer[0] = $FF) and (EmpfangBuffer[1] = $0) then
    Result:='Empfangsfehler'
  else
    begin
      if (EmpfangBuffer[0] = $21) and (EmpfangBuffer[1] = $43) then begin
        tmp:=(EmpfangBuffer[2] + EmpfangBuffer[3]) mod $100; // Check Pruefziffer
        if tmp  <> EmpfangBuffer[4] then
          Result:='falsche Prüfziffer'
          else
            begin
              case EmpfangBuffer[2] of
                    $A3: Result:='BLNet';
                    $A2: Result:='BL232 (Datensicherung)';
                    $A8: Result:='BL232 bzw DLoggUSB (1DL)';
                    $D1: Result:='BL232 bzw DLoggUSB (2DL)';
              end;
              FW_Version:=EmpfangBuffer[3];
              if FW_Version = 0 then
                Result:=Result+';''ungültige Firmware'
              else begin
                DefaultFormatSettings.DecimalSeparator:='.';
                Result:=Result+';'+FloatToStr(FW_Version/100);
                DefaultFormatSettings.DecimalSeparator:=',';
                end;
              end;
        end
      else
        Result:='-Empfangsfehler-';
    end;
end;

function TSolDat.GetBetriebstyp: String;
var
  sendbyte      : Integer;
  erg, i        : Integer;
begin
  erg:=0;
  sendbyte:=C_BETRIEBSMODE;
  EmpfangBuffer[0]:=$0;

  if NOT VerbindeBLNet then begin
    Result:='Verbindungsfehler';
    Exit;
  end;
  erg:=TCPSol.SolCon.Send(sendbyte,1);
  if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
    TCPSol.SolCon.Disconnect();
    TCPSol.Free;
    exit;
  end;
  TCPSol.SolCon.Disconnect();
  TCPSol.Free;

  case EmpfangBuffer[0] of
        $80: Result:='Datenlogging DL';  // Datenlogging DL
        $8C: Result:='Datenlogging CAN'; // CAN-Logging
        $C0: Result:='Datensicherung (bei BL232)';
  end;
end;

function TSolDat.ReadLogIvall: Integer;
//liefert "0" bei Firmware BL-Net < 2.13
var
//  sendbyte      : Array [0..1] of Byte;
  sendbyte, erg, kriterium  : Integer;
begin
  kriterium:=0;
  GetFirmware;
  if FW_Version < 214 then begin
    Result:=kriterium;
    Exit;
  end;

  if NOT VerbindeBLNet then begin
    Exit;
  end;

  sendbyte:=C_MODULMODUS;
  EmpfangBuffer[0]:=$0;
  erg:=TCPSol.SolCon.Send(sendbyte,2);
  if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
    TCPSol.SolCon.Disconnect();
    TCPSol.Free;
    exit;
  end;

  sendbyte:=C_GETSPEICHERKRITERIUM;
  EmpfangBuffer[0]:=$0;

  erg:=TCPSol.SolCon.Send(sendbyte,2);
  if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
    TCPSol.SolCon.Disconnect();
    TCPSol.Free;
    exit;
  end;
  if EmpfangBuffer[0] = sendbyte then begin
    kriterium:=EmpfangBuffer[1];
  end;

  TCPSol.SolCon.Disconnect();
  TCPSol.Free;
  Result:=kriterium;
end;

procedure TSolDat.SetBetriebstyp(BTyp: String);
// BTyp darf nur 'DL', 'CAN', 'BL232DS'
var
  sendbyte   : Array [0..1] of Integer;
  tag        : Boolean;
  erg        : Integer;
begin
  tag:=False;
  sendbyte[0]:=$22;
  if BTyp = 'DL' then begin
    sendbyte[1]:=$80;
    tag:=True;
  end;
  if BTyp = 'CAN'then begin
    sendbyte[1]:=$8C;
    tag:=True;
  end;
  if BTyp = 'BL232DS' then begin
     sendbyte[1]:=$C0;
     tag:=True;
  end;
  if tag then begin
    erg:=0;
    EmpfangBuffer[0]:=$0;
    TCPSol:=TSolConn.Create;
    if NOT VerbindeBLNet then begin
//      Result:='Verbindungsfehler';
      Exit;
    end;
    erg:=TCPSol.SolCon.Send(sendbyte,2);
    if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
       TCPSol.SolCon.Disconnect();
       TCPSol.Free;
       exit;
    end;
    TCPSol.SolCon.Disconnect();
    TCPSol.Free;
  //case EmpfangBuffer[0] of
  //      $80: Result:='Datenlogging DL gesetzt';  // Datenlogging DL
  //      $8C: Result:='Datenlogging CAN gesetzt'; // CAN-Logging
  //      $C0: Result:='Datensicherung (bei BL232) gesetzt';
  //end;
  end;
end;

procedure TSolDat.SetLogDaten(BLNetReset: Boolean);
begin

end;

// Konfiguration Datenlogging CAN lesen
function TSolDat.GetConfigCAN: TCANkonfig;
var
  sendbyte   : Integer;
  tag        : Boolean;
  erg, i, j, pruef  : Integer;
begin
 i:=0;
 pruef:=0;
 sendbyte:=C_KONFIGCANGET;
 EmpfangBuffer[0]:=$0;

 if NOT VerbindeBLNet then begin
   Exit;
 end;
 erg:=TCPSol.SolCon.Send(sendbyte,1);
 if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
   TCPSol.SolCon.Disconnect();
   TCPSol.Free;
   exit;
 end;
 TCPSol.SolCon.Disconnect();
 TCPSol.Free;

 for i:= 0 to erg-2 do
   pruef:=pruef + EmpfangBuffer[i];
 j:=1;
 if EmpfangBuffer[erg-1] = (pruef mod $100) then begin
   FTCANkonfig.AnzRahmen:=EmpfangBuffer[0];
   for i:=1 to FTCANkonfig.AnzRahmen do begin
       FTCANkonfig.KnotenNr[i]:=EmpfangBuffer[j];
       FTCANkonfig.RahmenNr[i]:=EmpfangBuffer[j+1];
       j:=j+2
   end;
 end;
end;

// Konfiguration Datenlogging CAN setzen
procedure TSolDat.SetConfigCAN(CANRahmen: TCANkonfig);
var
  sendbyte   : Array of Byte;
  erg, i, j, pruef, anzahl_sbyte  : Integer;
begin
 i:=0;
 pruef:=0;
 anzahl_sbyte:=0;
 sendbyte[0]:=C_KONFIGCANSET;
 EmpfangBuffer[0]:=$0;
 sendbyte[1]:=CANRahmen.AnzRahmen;
 j:=2;
 for i:=1 to CANRahmen.AnzRahmen do begin
     if (CANRahmen.KnotenNr[i] > 0) and (CANRahmen.KnotenNr[i] < 63) then
       FTCANkonfig.KnotenNr[i]:=CANRahmen.KnotenNr[i]
     else
       FTCANkonfig.KnotenNr[i]:=0;
     if (FTCANkonfig.RahmenNr[i] = 1) or (FTCANkonfig.RahmenNr[i] = 2) then
       FTCANkonfig.RahmenNr[i]:=CANRahmen.RahmenNr[i]
     else
       FTCANkonfig.RahmenNr[i]:=0;
     sendbyte[j]:=FTCANkonfig.KnotenNr[i];
     sendbyte[j+1]:=FTCANkonfig.RahmenNr[i];
     j:=j+2;
 end;

 anzahl_sbyte:=CANRahmen.AnzRahmen*2 + 2;
 for i:=0 to anzahl_sbyte-1 do
   pruef:=pruef + sendbyte[i];

 sendbyte[anzahl_sbyte+1]:=pruef mod $100;

 if NOT VerbindeBLNet then begin
//   Result:='Verbindungsfehler';
   Exit;
 end;
 erg:=TCPSol.SolCon.Send(sendbyte,anzahl_sbyte+1);
 if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
   TCPSol.SolCon.Disconnect();
   TCPSol.Free;
   exit;
 end;
 TCPSol.SolCon.Disconnect();
 TCPSol.Free;
end;

// aktuelle Daten holen
function TSolDat.GetAktuelleDaten: Boolean;
var
  sendbyte      : Array [0..1] of Byte;
  erg           : Integer;
  empfangbyte   : Byte;
begin
  erg:=0;
  sendbyte[0]:=C_MODULMODUS;
  EmpfangBuffer[0]:=$0;
  sendbyte[1]:=FAktuelleDatenCAN;

  if NOT VerbindeBLNet then begin
    Result:=False;
    Exit;
  end;
  erg:=TCPSol.SolCon.Send(sendbyte,1);
  if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
     TCPSol.SolCon.Disconnect();
     TCPSol.Free;
     Result:=False;
     exit;
  end;

  case EmpfangBuffer[0] of
     $DC: // CAN-Logging -> KONFIGCAN (Anzahl Datenrahmen ermitteln)
         sendbyte[0]:=C_KONFIGCANGET;
     $A8:  // 1 DL- Modus
         sendbyte[0]:=C_AKTUELLEDATENLESEN;
     $D1:  // 2 DL- Modus
         sendbyte[0]:=C_AKTUELLEDATENLESEN;
     $AB: begin
          if EmpfangBuffer[0] = $AB then begin
             LogArray[0].RDateTime:=now;
             Result:=False;
             TCPSol.SolCon.Disconnect();
             TCPSol.Free;
             Exit;
          end;
        end;
  end;
  if sendbyte[0] = $DC then
    erg:=TCPSol.SolCon.Send(sendbyte,2)
  else
    erg:=TCPSol.SolCon.Send(sendbyte,1);
  if Not Empfang then begin // keine Daten empfangen, bzw. Abbruch der Schleife
     TCPSol.SolCon.Disconnect();
     TCPSol.Free;
     exit;
  end;
  TCPSol.SolCon.Disconnect();
  TCPSol.Free;
//  Anzahl empfangene Byte:
//     28: ein Datensatz UVR61_3
//     57: ein Datensatz UVR1611
//     55: zwei Datensaetze UVR61_3
//     84: je ein Datensatz UVR1611 + UVR61_3
//    113: zwei Datensaetze UVR1611
  case AnzahlByteGelesen of
     28: UVR61_3_aktDaten(1);
     57: UVR1611_aktDaten(1);
     55: UVR61_3_aktDaten(2);
     84: begin
         case EmpfangBuffer[0] of
            $80: UVR1611_aktDaten(3); // erster DS ist UVR1611
            $90: UVR61_3_aktDaten(3); // erster DS ist UVR61-3
         end;
     end;
     113: UVR1611_aktDaten(2);
  end;
  Result:=True;
end;

procedure TSolDat.fuelleLogArray(Data: TLogRecIn; ArrayZeile:Integer);
var
  iSensor   : Integer;
  i, j,tmp_wert : Integer;
  iTemp     : SmallInt;
  Ausgang   : TAusgang;
  LowHighByte  : Array[0..1] of Byte;
  ByteFolge    : Array[0..3] of Byte;
  FDebugFile  : TFileStream;
  FDebugFile2 : TFileStream;
begin
 // +++ Debug
  //FDebugFile := TFileStream.Create('Debug.LogArray',fmCreate);
  //FDebugFile2 := TFileStream.Create('Data.LogArray',fmCreate);
  //FDebugFile2.WriteBuffer(Data,SizeOf(Data));
 // +++
 i:=ArrayZeile;
 for j:=0 to 15 do begin
   Move(Data.Sensoren[j],LowHighByte,2);
   SENS_Art[j] := eingangsparameter(LowHighByte[1]);
   case SENS_Art[j] of
        0, 1: LogArray[i].Sensoren[i] := 0;
   //         1: LogArray[i].Sensoren[j] := 0; // digit. Pegel (AUS)
        2: LogArray[i].Sensoren[j] := berechnetemp(LowHighByte[0],LowHighByte[1],SENS_Art[j]); // Temp.
        3: LogArray[i].Sensoren[j] := berechnevol(LowHighByte[0],LowHighByte[1]);
        6: LogArray[i].Sensoren[j] := berechnetemp(LowHighByte[0],LowHighByte[1],SENS_Art[j]); // Strahlung
        7: LogArray[i].Sensoren[j] := berechnetemp(LowHighByte[0],LowHighByte[1],SENS_Art[j]); // Raumtemp.
        9: LogArray[i].Sensoren[j] := 1; // digit. Pegel (EIN)
        10: LogArray[i].Sensoren[j] := berechnetemp(LowHighByte[0],LowHighByte[1],SENS_Art[j]); // Minus-Temperaturen
        15: LogArray[i].Sensoren[j] := berechnetemp(LowHighByte[0],LowHighByte[1],SENS_Art[j]); // Minus-Raumtemp.
   end;
 end;
 for j:=0 to 7 do begin
     if testbit( Data.Ausgaenge[0], j )  then begin
       LogArray[i].Ausgaenge[j]:=True;
//       AUSG[z] := 1;
     end
     else begin
       LogArray[i].Ausgaenge[j]:=False;
//       AUSG[z] := 0;
     end;
 end;
 for j:=0 to 4 do begin
   if testbit( Data.Ausgaenge[1], j ) then begin
     LogArray[i].Ausgaenge[j+8]:=True;
//     AUSG[z+8] := 1;
   end
   else begin
     LogArray[i].Ausgaenge[j+8]:=False;
//     AUSG[z+8] := 0;
   end;
 end;

 //for j:=0 to 12 do begin
 //  if Data.a Ausgang in Data.Ausgaenge then
 //    LogArray[i].Ausgaenge[j]:=True
 // else
 //    LogArray[i].Ausgaenge[j]:=False;
 //    j:=j+1;
 // end;
  if TestBit(Data.dza1,7) then
     LogArray[i].dza1_aktiv:=True
  else
     LogArray[i].dza1_aktiv:=False;
  LogArray[i].dza1_stufe:=Data.dza1 and $1F;
  if TestBit(Data.dza2,7) then
    LogArray[i].dza2_aktiv:=True
  else
    LogArray[i].dza2_aktiv:=False;
  LogArray[i].dza2_stufe:=Data.dza2 and $1F;
  if TestBit(Data.dza6,7) then
    LogArray[i].dza6_aktiv:=True
  else
    LogArray[i].dza6_aktiv:=False;
LogArray[i].dza6_stufe:=Data.dza6 and $1F;
  if TestBit(Data.dza7,7) then
    LogArray[i].dza7_aktiv:=True
  else
    LogArray[i].dza7_aktiv:=False;
  LogArray[i].dza7_stufe:=Data.dza7 and $1F;
  if TestBit(Data.WmzFlag,0) then
    LogArray[i].Wmz1_aktiv:=True
  else
    LogArray[i].Wmz1_aktiv:=False;
  if TestBit(Data.WmzFlag,1) then
    LogArray[i].Wmz2_aktiv:=True
  else
    LogArray[i].Wmz2_aktiv:=False;
  LogArray[i].Kwh1:=Data.Kwh1 / 10;
  LogArray[i].mwh1:=Data.mwh1;
  LogArray[i].Lstg1:=Data.Wmz1 / 100 ;
  LogArray[i].Kwh2:=Data.Kwh2 / 10;
  LogArray[i].mwh2:=Data.mwh2;
  LogArray[i].Lstg2:=Data.Wmz2 / 100;

  // +++ Debug
    //FDebugFile.WriteBuffer(LogArray[i],SizeOf(LogArray[i]));
    //FDebugFile.Free;
    //FDebugFile2.Free;
end;

function TSolDat.SetData(DataIn: array of Byte; Count: Integer): Boolean;
begin

end;

// CREATE
constructor TSolDat.create;
var
  i         : Integer;
begin
  BLConn:=TSolConn.Create;
  OnReOk:=False;
  EmpfangBuffer:=AllocMem(120);  //Speicher anfordern
  //New(AktDaten);
  //for i:=0 to 12 do
  //  AktDaten^.Ausgaenge[i]:=False;
  //AktDaten^.dza1_aktiv:=False;
  //AktDaten^.dza1_stufe:=0;
  //AktDaten^.dza2_aktiv:=False;
  //AktDaten^.dza2_stufe:=0;
  //AktDaten^.dza6_aktiv:=False;
  //AktDaten^.dza6_stufe:=0;
  //AktDaten^.dza7_aktiv:=False;
  //AktDaten^.dza7_stufe:=0;
  //AktDaten^.Kwh1:=0;
  //AktDaten^.Kwh2:=0;
  //AktDaten^.Lstg1:=0;
  //AktDaten^.Lstg2:=0;
  //AktDaten^.mwh1:=0;
  //AktDaten^.mwh2:=0;
  //AktDaten^.RDateTime:=now;
  //for i:=0 to 15 do
  //  AktDaten^.Sensoren[i]:=0;
  //AktDaten^.Wmz1_aktiv:=False;
  //AktDaten^.Wmz2_aktiv:=False;
  FDataFlashReset:=False;
  LogIvall:='x';
  FBLNetIPAdresse:='192.168.1.1';
  FBLNetPort:=40000;
  USBPort:='no Port';
  FLogDatenDir:='';
  FTCANkonfig.AnzRahmen:=1;
  FAktuelleDatenCAN:=1;
  for i:=1 to 8 do begin
      FTCANkonfig.KnotenNr[i]:=0;
      FTCANkonfig.RahmenNr[i]:=0;
  end;
end;

end.

