unit unit_form_sensoren;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls;

type

  { TForm_Sensoren }

  TForm_Sensoren = class(TForm)
    Panel1: TPanel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Sensoren: TForm_Sensoren;

implementation

uses Unit1;

{ TForm_Sensoren }



initialization
  {$I unit_form_sensoren.lrs}

end.

