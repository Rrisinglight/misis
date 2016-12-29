library Security;

uses
  SysUtils,
  Classes;

{$R *.res}

procedure Code(var text: string; password: string;
  decode: boolean);stdcall;
var
  i, PasswordLength: integer;
  sign: shortint;
begin
  PasswordLength := length(password);
  if PasswordLength = 0 then Exit;
  if decode
    then sign := -1
    else sign := 1;
  for i := 1 to Length(text) do
    text[i] := chr(ord(text[i]) + sign *
      ord(password[i mod PasswordLength + 1]));
end;

exports Code;
begin
end.
