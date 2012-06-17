program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,{$ENDIF}
  clocale,{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, lnetvisual, lazcontrols, tachartlazaruspkg, zvdatetimectrls,
  u_linsoldat, unit_form_sensoren
  { you can add units after this };

{$IFDEF WINDOWS}{$R project1.rc}{$ENDIF}



//{$R *.res}

//{$R *.res}

{$R *.res}

begin
  Application.Title:='LinSol - UVR-Daten anzeigen';
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_Sensoren, Form_Sensoren);
  Application.Run;
end.

