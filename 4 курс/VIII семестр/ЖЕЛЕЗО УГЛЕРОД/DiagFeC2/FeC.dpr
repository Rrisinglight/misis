program FeC;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  GPainter in 'GPainter.pas',
  Points in 'Points.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
