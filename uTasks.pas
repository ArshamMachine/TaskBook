unit uTasks;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Data.Win.ADODB,
  Vcl.StdActns, Vcl.DBActns, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.DBCtrls, Vcl.Mask;

type
  TfTasks = class(TForm)
    pnlGrid: TPanel;
    pnlControls: TPanel;
    dbgrdTasks: TDBGrid;
    GridPanel1: TGridPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnCancel: TButton;
    btnSave: TButton;
    btnStart: TButton;
    btnFinish: TButton;
    qryTasks: TADOQuery;
    dsTasks: TDataSource;
    qryTaskId: TAutoIncField;
    intgrfldTasksday_id: TIntegerField;
    qryTaskstitle: TWideStringField;
    qryTasksdescription: TWideMemoField;
    qryTasksdue_date: TStringField;
    qryTasksis_active: TBooleanField;
    qryTaskscreated_at: TWideStringField;
    qryTasksupdated_at: TWideStringField;
    qryTasksstarted_at: TWideStringField;
    qryTasksfinished_at: TWideStringField;
    pmRightClick: TPopupMenu;
    Start1: TMenuItem;
    Start2: TMenuItem;
    pnlInputs: TPanel;
    lblTtile: TLabel;
    dbedttitle: TDBEdit;
    lblDescription: TLabel;
    dbmmodescription: TDBMemo;
    lbl: TLabel;
    dbedtdue_date: TDBEdit;
    actmgr1: TActionManager;
    DatasetInsert1: TDataSetInsert;
    DatasetDelete1: TDataSetDelete;
    DatasetEdit1: TDataSetEdit;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    btnBack: TButton;
    WindowClose1: TWindowClose;
    edtDayId: TEdit;
    lblDayId: TLabel;
    btnCopy: TButton;
    procedure btnFinishClick(Sender: TObject);
    procedure WindowClose1Execute(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure DatasetDelete1Execute(Sender: TObject);
    procedure dsTasksStateChange(Sender: TObject);
    procedure qryTasksAfterInsert(DataSet: TDataSet);
    procedure qryTasksBeforeInsert(DataSet: TDataSet);
    procedure qryTasksBeforePost(DataSet: TDataSet);
    procedure btnCopyClick(Sender: TObject);
    procedure dbedtdue_dateDblClick(Sender: TObject);
    procedure dbgrdTasksDblClick(Sender: TObject);
    procedure dbedttitleDblClick(Sender: TObject);
  private
    procedure RefreshGrid;
    procedure SetControlsEnabledStatus(enabled: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTasks: TfTasks;

implementation

uses
  uDataModule, uDaySelector, uTasksSelector;

{$R *.dfm}

procedure TfTasks.btnCopyClick(Sender: TObject);
var
  fdaysSelector: TfDaysSelector;
  sDay_id,sTask_id,sCmd: string;
begin
    fdaysSelector := TfDaysSelector.Create(self);
    with fdaysSelector do
  begin
    if qryTasks.RecordCount = 0 then
      Exit;
    with qryDaysSelector do
    begin
      Parameters.ParamByName('person_id').Value := UserId;
      Close;
      Open;
    end;
    ShowModal;
     if ModalResult <> mrOk then
      exit;
    if qryDaysSelector.RecordCount = 0 then
      exit;
    sDay_id := IntToStr(qryDaysSelectorid.Value);
//    if sDay_id = qryTasks.FieldByName('dya_id').Value then
//    begin
//    MessageDlg('Can not copy a task to its day !',TMsgDlgType.mtError,[TMsgDlgBtn.mbClose],0);
//    end;
    sTask_id:= qryTasks.FieldByName('id').AsString;
    sCmd:= 'INSERT INTO [dbo].[tblTasks] ' + #10
     + '           ([day_id] ' + #10
     + '           ,[title] ' + #10
     + '           ,[description] ' + #10
     + '           ,[created_at] ' + #10
     + '           ,[updated_at] ' + #10
     + '           ,[started_at] ' + #10
     + '           ,[finished_at] ' + #10
     + '           ,[due_date] ' + #10
     + '           ,[is_active]) ' + #10
     + 'SELECT :day_id ' + #10
     + '           ,[title] ' + #10
     + '           ,[description] ' + #10
     + '           ,GETDATE() ' + #10
     + '           ,NULL ' + #10
     + '           ,NULL ' + #10
     + '           ,NULL ' + #10
     + '           ,[due_date] ' + #10
     + '           ,[is_active] ' + #10
     + 'FROM tblTasks AS tt ' + #10
     + 'WHERE id=:task_id';
    with DataModule1.cmd1 do
    begin
      try
        CommandText := sCmd;
        Parameters.ParamByName('task_id').Value := sTask_id;
        Parameters.ParamByName('day_id').Value := sDay_id;
        Execute;
        MessageDlg('The selected task copied successfully!', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbClose], 0);
      except
        on E: Exception do
          MessageDlg(e.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbClose], 0);
      end;
    end;
    Free;
  end;
  RefreshGrid;
end;

procedure TfTasks.btnFinishClick(Sender: TObject);
var
  sSqlCmd: string;
begin
  if qryTasks.RecordCount = 0 then
    exit;
  if not qryTasksfinished_at.IsNull then
    if MessageDlg('The task has been finished before!'+#10
    +' Are you sure you want to change the finish time?', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) <> mrYes then
      Exit;
  sSqlCmd := 'UPDATE tblTasks SET finished_at = GETDATE() WHERE id =:Task_Id ';
  with DataModule1 do
  begin
    cmd1.CommandText := sSqlCmd;
    cmd1.Parameters.ParamByName('Task_Id').Value := qryTasks.FieldByName('id').AsString;
    cmd1.Execute;
  end;
  RefreshGrid;
end;

procedure TfTasks.btnStartClick(Sender: TObject);
var
  sSqlCmd: string;
  iTaskId: Integer;
begin
  if qryTasks.RecordCount = 0 then
    exit;
  if qryTasksstarted_at.AsString <> '' then
  begin
    if MessageDlg('The task has been started before!'+#10
    +' Are you sure you want to restart?', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) <> mrYes then
    begin
      Exit;
    end;
  end;
  sSqlCmd := 'UPDATE tblTasks SET started_at = GETDATE(),finished_at = NULL WHERE id =:Task_Id ';
  with DataModule1 do
  begin
    cmd1.CommandText := sSqlCmd;
    cmd1.Parameters.ParamByName('Task_Id').Value := qryTasks.FieldByName('id').AsString;
    cmd1.Execute;
  end;
  iTaskId:=qryTaskId.Value;
  RefreshGrid;
  qryTasks.Locate('id',iTaskId,[]);
end;

procedure TfTasks.DatasetDelete1Execute(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    qryTasks.Delete;
end;

procedure TfTasks.dbedtdue_dateDblClick(Sender: TObject);
var sQry,sCurrentDate:string;
begin
  sQry:= 'SELECT FORMAT(GETDATE() ,''yyyy/MM/dd'' ,''fa'') AS today_fa';
  DataModule1.ExecuteSql(sQry);
  sCurrentDate:= DataModule1.qry1.FieldByName('today_fa').Value;
  dbedtdue_date.Text:=sCurrentDate;
end;

procedure TfTasks.dbedttitleDblClick(Sender: TObject);
var
  ftasksSelector: TfTasksSelector;
  sDay_id, sTask_id, sCmd: string;
begin
ftasksSelector := TfTasksSelector.Create(self);
  with ftasksSelector do
  begin
//    if qryTasksSelector.RecordCount = 0 then
//      Exit;
    with qryTasksSelector do
    begin
      Parameters.ParamByName('person_id').Value := UserId;
      Close;
      Open;
    end;
    ShowModal;
    if ModalResult <> mrOk then
      Exit;
    dbedttitle.Text := qryTasksSelector.FieldByName('title').Value;
  end;
end;

procedure TfTasks.dbgrdTasksDblClick(Sender: TObject);
begin
  qryTasks.Edit;
  dbmmodescription.SetFocus;
end;

procedure TfTasks.dsTasksStateChange(Sender: TObject);
begin
  if qryTasks.State in [dsEdit, dsInsert] then
  begin
    SetControlsEnabledStatus(True);
  end
  else
  begin
    SetControlsEnabledStatus(False);
  end;

end;

procedure TfTasks.RefreshGrid;
begin
  qryTasks.Close;
  qryTasks.Open;
end;

procedure TfTasks.SetControlsEnabledStatus(enabled: Boolean);
begin
  dbedttitle.Enabled := enabled;
  dbmmodescription.Enabled := enabled;
  dbedtdue_date.Enabled := enabled;
  btnStart.Enabled := not enabled;
  btnFinish.Enabled := not enabled;
  btnCopy.Enabled := not enabled;
end;

procedure TfTasks.qryTasksAfterInsert(DataSet: TDataSet);
begin
  dbedttitle.SetFocus;
end;

procedure TfTasks.qryTasksBeforeInsert(DataSet: TDataSet);
var
  sSqlCmd: string;
begin

end;

procedure TfTasks.qryTasksBeforePost(DataSet: TDataSet);
var
  sSqlCmd: string;
begin
  qryTasks.FieldByName('day_id').Value := edtDayId.Text;
  if qryTasks.State = dsEdit then
  begin
    sSqlCmd := 'UPDATE tblTasks SET updated_at = GETDATE() WHERE id =:Task_Id ';
    with DataModule1 do
    begin
      cmd1.CommandText := sSqlCmd;
      cmd1.Parameters.ParamByName('Task_Id').Value := qryTasks.FieldByName('id').AsString;
      cmd1.Execute;
    end;
  end
//  else if qryTasks.State = dsInsert then
//  begin
//    sSqlCmd := 'UPDATE tblTasks SET created_at = GETDATE() WHERE id =:Task_Id ';
//    with DataModule1 do
//    begin
//      cmd1.CommandText := sSqlCmd;
//      cmd1.Parameters.ParamByName('Task_Id').Value := qryTasks.FieldByName('id').AsString;
//      cmd1.Execute;
//    end;
//    RefreshGrid;
//  end
end;

procedure TfTasks.WindowClose1Execute(Sender: TObject);
begin
  Self.Close;
end;

end.

