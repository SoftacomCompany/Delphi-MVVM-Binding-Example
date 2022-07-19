unit View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  View.Controller, ViewModel, FMX.Controls.Presentation, FMX.StdCtrls,
  Data.Bind.Components, Data.Bind.ObjectScope,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Controls, FMX.Layouts, Fmx.Bind.Navigator;

type
  TMainForm = class(TForm)
    ControllerFrame1: TControllerFrame;
    Label1: TLabel;
  private
    FViewModel: TViewModel;
  public
    constructor Create(AOwner: TComponent); override;
  end;

const ModelDataPrefix = 'ModelData';

var
  MainForm: TMainForm;


implementation

{$R *.fmx}

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited;
{$IFDEF LIVEBINDING_OFF}
  FViewModel := TViewModel.Create;
  for var i: Integer := 0 to Length(ControllerFrame1.EnumAtoms) - 1 do
  begin
    ControllerFrame1.EnumAtoms[i].SetImage(FViewModel.GetModelImages[i]);
    ControllerFrame1.EnumAtoms[i].SetName(Concat(ModelDataPrefix, i.ToString))
  end;
{$ENDIF}
end;

end.
