unit ViewModel.LiveBindingsProxy;

interface

uses
  System.SysUtils, System.Classes, Data.Bind.ObjectScope, Data.Bind.Components,
  ViewModel, Data.Bind.GenData, Fmx.Bind.GenData, Vcl.Bind.GenData;

type
  TViewModelLiveBindingsProxy = class(TDataModule)
    ViewModelDataGeneratorAdapter: TDataGeneratorAdapter;
    ViewModelDataBindSource: TAdapterBindSource;
    procedure ViewModelDataBindSourceCreateAdapter(Sender: TObject; var ABindSourceAdapter: TBindSourceAdapter);
  private
    FViewModel: TViewModel;
    function GetVewModel: TViewModel;
  public
    property ViewModel: TViewModel read GetVewModel;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  ViewModelLiveBindingsProxy: TViewModelLiveBindingsProxy;

implementation

  var
    VM: TViewModel;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

constructor TViewModelLiveBindingsProxy.Create(AOwner: TComponent);
begin
  inherited;
  FViewModel := TViewModel.Create;
end;

destructor TViewModelLiveBindingsProxy.Destroy;
begin
  FreeAndNil(FViewModel);
  inherited;
end;

function TViewModelLiveBindingsProxy.GetVewModel: TViewModel;
begin
  if Assigned(FViewModel) then
    Result := FViewModel
  else
  begin
    Result := TViewModel.Create;
    FViewModel := Result;
  end;
end;

procedure TViewModelLiveBindingsProxy.ViewModelDataBindSourceCreateAdapter(Sender: TObject; var ABindSourceAdapter: TBindSourceAdapter);
begin
  ABindSourceAdapter := TObjectBindSourceAdapter<TViewModel>.Create(self, ViewModel, False);
end;

end.
