program Project2;

uses
  Vcl.Forms,
  Unit4 in 'Unit4.pas' {FrmDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmDemo, FrmDemo);
  Application.Run;
end.
