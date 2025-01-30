unit LojaUtils;

interface
uses
  System.Classes, System.TypInfo, Vcl.StdCtrls, System.SysUtils, Vcl.Controls, Vcl.Forms;
type
  TLojaUtils = class
    class procedure HabilitarComponentes(Owner: TComponent; ComponentClass: TClass; Enabled: Boolean = True);
    class procedure LimparComponentes(Owner: TComponent; ComponentClass: TClass);
  end;
procedure BrincandoRTTI(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
implementation

uses
  Vcl.ExtCtrls;
{ TLojaUtils }

class procedure TLojaUtils.HabilitarComponentes(Owner: TComponent; ComponentClass: TClass; Enabled: Boolean);
var
  i: Integer;
  Component: TComponent;
begin
  if not Assigned(Owner) then
    Exit;
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    Component := Owner.Components[i];
    if Component is ComponentClass then
    begin
      if IsPublishedProp(Component, 'Enabled') then
      begin
        SetPropValue(Component, 'Enabled', not GetPropValue(Component, 'Enabled'));
      end;
    end;
  end;
end;

class procedure TLojaUtils.LimparComponentes(Owner: TComponent; ComponentClass: TClass);
var
  i: Integer;
  Component: TComponent;
begin
  if not Assigned(Owner) then
    Exit;

  for i := 0 to Owner.ComponentCount - 1 do
  begin
    Component := Owner.Components[i];
    if Component is ComponentClass then
    begin
      if Component is TLabeledEdit then
      begin
        (Component as TLabeledEdit).Text := '';
      end;

    end;
  end;
end;

procedure BrincandoRTTI(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i: Integer;
begin
  if Button = mbRight then
  begin
    i := 10;
    while i > 0 do
    begin
      TLojaUtils.HabilitarComponentes(Application.MainForm, TLabeledEdit, Odd(i));
      Sleep(250);
      Dec(i);
      if Sender = nil then
        Exit;
    end;
  end;
end;
end.




