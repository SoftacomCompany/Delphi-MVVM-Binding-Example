unit View.Controller;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, View.Controller.Atom,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.ObjectScope, {ViewModel,}
    ViewModel.LiveBindingsProxy;

type
  TControllerFrame = class(TFrame)
    FlowLayout: TFlowLayout;
    AtomFrame1: TAtomFrame;
    AtomFrame2: TAtomFrame;
    AtomFrame3: TAtomFrame;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
  private
    FAtoms: TArray<TAtomFrame>;
  public
    function EnumAtoms:TArray<TAtomFrame>;
  end;

implementation

{$R *.fmx}

{ TControllerFrame }

function TControllerFrame.EnumAtoms: TArray<TAtomFrame>;
begin
  if Length(FAtoms) <> 0 then
    Result := FAtoms
  else
  begin
    for var i: Integer := 0 to ComponentCount - 1 do
      if Components[i] is TAtomFrame then
      begin
        SetLength(Result, Length(Result) + 1);
        Result[Length(Result) - 1] := TAtomFrame(Components[i]);
      end;
    FAtoms := Result;
  end;
end;

end.
