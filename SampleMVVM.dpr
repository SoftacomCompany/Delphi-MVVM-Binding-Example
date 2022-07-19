program SampleMVVM;

uses
  System.StartUpCopy,
  FMX.Forms,
  View in 'View.pas' {MainForm},
  Model in 'Model.pas',
  ViewModel in 'ViewModel.pas',
  View.Controller in 'View.Controller.pas' {ControllerFrame: TFrame},
  View.Controller.Atom in 'View.Controller.Atom.pas' {AtomFrame: TFrame},
  Model.LiveBindingsProxy in 'Model.LiveBindingsProxy.pas' {ModelLiveBindingsProxy: TDataModule},
  ViewModel.LiveBindingsProxy in 'ViewModel.LiveBindingsProxy.pas' {ViewModelLiveBindingsProxy: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TViewModelLiveBindingsProxy, ViewModelLiveBindingsProxy);
  Application.Run;
end.
