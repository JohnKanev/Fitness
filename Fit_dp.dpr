program Fit_dp;

uses
  Forms,
  FitnessApp in 'FitnessApp.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Fitness';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
