unit Model.LiveBindingsProxy;

interface

uses
  System.SysUtils, System.Classes, Data.Bind.GenData, Data.Bind.Components,
  Data.Bind.ObjectScope, Model;

type
  TModelLiveBindingsProxy = class(TDataModule)
    ModelDataGeneratorAdapter: TDataGeneratorAdapter;
    ModelDataBindSource: TAdapterBindSource;
    procedure ModelAdapterBindSourceCreateAdapter(
      Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
  private
    FModel: TModel;
    FModelBinder: TObjectBindSourceAdapter;
    function GetModel: TModel;
    property Model: TModel read GetModel;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  ModelLiveBindingsProxy: TModelLiveBindingsProxy;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TModelLiveBindingsProxy }

constructor TModelLiveBindingsProxy.Create(AOwner: TComponent);
begin
  FModel := TModel.Create;
  inherited;
end;

function TModelLiveBindingsProxy.GetModel: TModel;
begin
  if Assigned(FModel) then
    Result := FModel
  else
    Result := TModel.Create;
end;

procedure TModelLiveBindingsProxy.ModelAdapterBindSourceCreateAdapter(
  Sender: TObject; var ABindSourceAdapter: TBindSourceAdapter);
begin
  ABindSourceAdapter := TObjectBindSourceAdapter<TModel>.Create(self, Model, False);
end;

end.
