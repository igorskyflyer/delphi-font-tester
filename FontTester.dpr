program FontTester;

uses
  Forms,
  FontTesterUnit in 'FontTesterUnit.pas' {formFT};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformFT, formFT);
  Application.Run;
end.
