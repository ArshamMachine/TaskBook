program TaskBook;

uses
  Vcl.Dialogs,
  Vcl.Forms,
  uLogin in 'uLogin.pas' {fLogin},
  uMain in 'uMain.pas' {fMain},
  uDataModule in 'uDataModule.pas' {DataModule1: TDataModule},
  uTasks in 'uTasks.pas' {fTasks},
  uDaySelector in 'uDaySelector.pas' {fDaysSelector},
  uTasksSelector in 'uTasksSelector.pas' {fTasksSelector},
  uDateTimePicker in 'uDateTimePicker.pas' {fDateTimePicker};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfLogin, fLogin);
  Application.CreateForm(TfDateTimePicker, fDateTimePicker);
  fLogin.ShowModal;
//  if fLogin.ModalResult =  then
//  begin
//    Application.CreateForm(TfMain,fMain);
//    Application.Run;
//  end;
end.

