﻿unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Data.Win.ADODB,
  Vcl.DBCtrls, Vcl.DBActns, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, RzStatus;

type
  TfMain = class(TForm)
    btnAdd: TButton;
    btnShowDay: TButton;
    btnExit: TButton;
    pnlGrid: TPanel;
    pnlControls: TPanel;
    dbgrdDays: TDBGrid;
    qryDays: TADOQuery;
    dsDays: TDataSource;
    GridPanel1: TGridPanel;
    btnFinish: TButton;
    qryDaysid: TAutoIncField;
    qryDays_person_id: TIntegerField;
    qryDaysworking_date: TWideStringField;
    qryDaysstarted_at: TWideStringField;
    qryDaysfinished_at: TWideStringField;
    qryDaysdescriptions: TWideMemoField;
    pnlInput: TPanel;
    lblDescriptions: TLabel;
    dbmmodescriptions: TDBMemo;
    actmgr1: TActionManager;
    actEditTimeSheet: TDataSetEdit;
    actPostTimeSheet: TDataSetPost;
    actCancelTimeSheet: TDataSetCancel;
    pnlbtns: TPanel;
    grdpnl1: TGridPanel;
    btnEdit: TButton;
    btnCancel: TButton;
    btnPost: TButton;
    rzclcksts1: TRzClockStatus;
    grpTimeSheet: TGroupBox;
    dbgrdTimeSheet: TDBGrid;
    qryTimeSheet: TADOQuery;
    dsTimeSheet: TDataSource;
    qryTimeSheetid: TAutoIncField;
    qryTimeSheetday_id: TIntegerField;
    qryTimeSheetin_time: TWideStringField;
    qryTimeSheetdescriptions: TWideMemoField;
    qryTimeSheetout_time: TWideStringField;
    grpDescriptions: TGroupBox;
    dbmmoTimeSheetDescriptions: TDBMemo;
    pnlbtnstimesheet: TPanel;
    grdpnl11: TGridPanel;
    btnTimeSheetEdit: TButton;
    btnTimeSheetCancel: TButton;
    btnTimeSheetPost: TButton;
    act: TAction;
    dtstdt: TDataSetEdit;
    dtstpst: TDataSetPost;
    dtstcncl: TDataSetCancel;
    btnSetTimesheetIn: TButton;
    btnTimeSheetOut: TButton;
    btnDeleteTimeSheet: TButton;
    actDeleteTimeSheet: TDataSetDelete;
    qryDaysday_name: TWideStringField;
    qryDaysdiff_in_time: TStringField;
    qryDaystotal_in_out_time: TStringField;
    btnReport: TButton;
    procedure btnExitClick(Sender: TObject);
    procedure dbgrdDaysDblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFinishClick(Sender: TObject);
    procedure dbmmodescriptionsDblClick(Sender: TObject);
    procedure dsDaysStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryDaysAfterScroll(DataSet: TDataSet);
    procedure dsTimeSheetStateChange(Sender: TObject);
    procedure btnSetTimesheetInClick(Sender: TObject);
    procedure btnTimeSheetOutClick(Sender: TObject);
    procedure qryTimeSheetAfterScroll(DataSet: TDataSet);
    procedure btnDeleteTimeSheetClick(Sender: TObject);
    procedure dbgrdDaysDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnReportClick(Sender: TObject);
  private
    procedure RefreshGrid;
    procedure RefreshTimeSheetGrid;
    procedure SetOutBtnEnableStatus;
    procedure CallTaskListForm(dayId:string);
    procedure OpenLastDayTasksForm;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

uses
  uDataModule, uTasks;

{$R *.dfm}

procedure TfMain.btnAddClick(Sender: TObject);
var
  sQry: string;
  sUserId: string;
begin
  sQry := 'IF EXISTS ' + #10 + '   ( ' + #10 + '       SELECT 1 ' + #10 + '       FROM   tblDays AS td ' + #10 + '       WHERE  FORMAT(td.working_date, ''yyyy/MM/dd'', ''fa'') = FORMAT(GETDATE(), ''yyyy/MM/dd'', ''fa'') ' + #10 + '   ) ' + #10 + 'BEGIN ' + #10 + '    SELECT ''Duplicate'' AS Result ' + #10 + 'END ' + #10 + 'ELSE ' + #10 + 'BEGIN ' + #10 + '    SELECT ''OK'' AS Result ' + #10 + 'END';
  with DataModule1 do
  begin
    ExecuteSql(sQry);
    if qry1.FieldByName('Result').AsString = 'Duplicate' then
    begin
//      MessageDlg('Today has been added before!', TMsgDlgType.mtError, [TMsgDlgBtn.mbClose], 0);
      OpenLastDayTasksForm;
      Exit
    end;
  end;
  sUserId := DataModule1.GetUserId('', '', True);
  if sUserId = '0' then
  begin
    MessageDlg('User not defined!', TMsgDlgType.mtError, [TMsgDlgBtn.mbClose], 0);
    Exit
  end;
  sQry := 'INSERT INTO [dbo].[tblDays] ' + #10 + '           ([working_date] ' + #10 + '           ,[started_at] ' + #10 + '           ,[finished_at] ' + #10 + '           ,[descriptions] ' + #10 + '           ,[person_id]) ' + #10 + 'SELECT GETDATE(),GETDATE(),NULL,NULL,' + QuotedStr(sUserId);
  DataModule1.ExecuteSqlCommand(sQry);
  RefreshGrid;
  OpenLastDayTasksForm;
end;

procedure TfMain.RefreshGrid;
begin
  qryDays.Close;
  qryDays.Open;
end;

procedure TfMain.RefreshTimeSheetGrid;
begin
  qryTimeSheet.Close;
  qryTimeSheet.Open;
end;

procedure TfMain.SetOutBtnEnableStatus;
begin
  if (qryTimeSheetin_time.IsNull) or (qryTimeSheet.RecordCount = 0) then
  begin
    btnTimeSheetOut.Enabled := False;
  end
  else
  begin
    btnTimeSheetOut.Enabled := True;
  end;
end;

procedure TfMain.CallTaskListForm(dayId:string);
var
  ftasks: TfTasks;
begin
  ftasks := TfTasks.Create(self);
  with ftasks do
  begin
    with qryTasks do
    begin
      if dayId <> '' then
      begin
        SQL.Add(' AND day_id = ' + dayId);
        fTasks.hasModifyPermition:=True;
      end;
      Close;
      Open;
    end;
    edtDayId.Text := qryDaysid.AsString;
    ShowModal;
    Free;
  end;
end;

procedure TfMain.OpenLastDayTasksForm;
begin
  qryDays.Last;
  CallTaskListForm(qryDaysid.AsString);
end;

procedure TfMain.btnDeleteTimeSheetClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    qryTimeSheet.Delete;
end;

procedure TfMain.btnExitClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to exit?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    Application.Terminate;
end;

procedure TfMain.btnFinishClick(Sender: TObject);
var
  sSqlCmd: string;
begin
  if qryDays.RecordCount = 0 then
    exit;
  if MessageDlg('Are you sure you want to finish this day?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) <> mrYes then
    Exit;
  sSqlCmd := 'UPDATE tblDays SET finished_at = GETDATE() WHERE id =:Day_Id ';
  with DataModule1 do
  begin
    cmd1.CommandText := sSqlCmd;
    cmd1.Parameters.ParamByName('Day_Id').Value := qryDays.FieldByName('id').AsString;
    cmd1.Execute;
  end;
  RefreshGrid;
end;

procedure TfMain.btnReportClick(Sender: TObject);
begin
  CallTaskListForm('');
end;

procedure TfMain.btnSetTimesheetInClick(Sender: TObject);
var sSqlCmd:string;
begin
  if (dsTimeSheet.State = dsEdit) then
  begin
    if (qryTimeSheet.RecordCount=0) then exit;
    with DataModule1 do
    begin
      sSqlCmd:= 'UPDATE [dbo].[tblTimeSheet] ' + #10
           + '   SET [in_time] = GETDATE() ' + #10
           + '      ,[out_time] = NULL ' + #10
           + ' WHERE id=:id';
      cmd1.CommandText := sSqlCmd;
      cmd1.Parameters.ParamByName('id').Value := qryTimeSheet.FieldByName('id').AsString;      
    end;
  end
  else
  begin
    with DataModule1 do
    begin
      sSqlCmd:= 'INSERT INTO [dbo].[tblTimeSheet] ' + #10
           + '           ([day_id] ' + #10
           + '           ,[in_time] ' + #10
           + '           ,[out_time] ' + #10
           + '           ,[descriptions]) ' + #10
           + 'SELECT :day_id,GETDATE(),NULL,NULL';
      cmd1.CommandText := sSqlCmd;
      cmd1.Parameters.ParamByName('day_id').Value := qryDays.FieldByName('id').AsString;            
    end;
  end;
  DataModule1.cmd1.Execute;
  RefreshTimeSheetGrid;
  if qryTimeSheet.State <> dsEdit then
    qryTimeSheet.Last;
end;

procedure TfMain.btnTimeSheetOutClick(Sender: TObject);
var
  sSqlCmd: string;
begin
  if qryTimeSheetin_time.IsNull then
  begin
    Exit;
  end;
  if not (qryTimeSheetout_time.IsNull) then
  begin
    if MessageDlg('The out time has been seted before. Are you sure you want to reset out time?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) <> mrYes then
      Exit;
  end;
  with DataModule1 do
  begin
    sSqlCmd:= 'UPDATE [dbo].[tblTimeSheet] ' + #10
         + '   SET [out_time] = GETDATE() ' + #10
         + ' WHERE id=:id';
    cmd1.CommandText := sSqlCmd;
          cmd1.Parameters.ParamByName('id').Value := qryTimeSheet.FieldByName('id').AsString;      
  end;
  DataModule1.cmd1.Execute;
  RefreshTimeSheetGrid;
end;

procedure TfMain.dbgrdDaysDblClick(Sender: TObject);
begin
  if qryDaysid.ToString = '' then
    exit
  else
  begin
    CallTaskListForm(qryDaysid.AsString);
  end;
end;

procedure TfMain.dbgrdDaysDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  TimeStr: string;
  Hours, Minutes: Word;
  TimeValue: TTime;
  DayOfWeek: string;
  ThresholdTime: TTime;
begin
  // Check if we are dealing with the 'total_in_out_time' column
  if Column.FieldName = 'total_in_out_time' then
  begin
    // Retrieve the time string and day of the week from the dataset
    try
      TimeStr := Column.Field.AsString;
      DayOfWeek := Column.Grid.DataSource.DataSet.FieldByName('day_name').AsString;
      // Determine the threshold time based on the day of the week
      if DayOfWeek = 'پنجشنبه' then  // Thursday in 'fa-IR'
        ThresholdTime := EncodeTime(4, 0, 0, 0)  // 04:00
      else if DayOfWeek = 'جمعه' then  // Friday in 'fa-IR'
        ThresholdTime := EncodeTime(0, 0, 0, 0)  // 00:00
      else
        ThresholdTime := EncodeTime(8, 0, 0, 0); // 08:00 for other days
      // Parse the time string (assumed format 'HH:mm')
      if (Length(TimeStr) = 5) and (TimeStr[3] = ':') then
      begin
        Hours := StrToIntDef(Copy(TimeStr, 1, 2), 0);
        Minutes := StrToIntDef(Copy(TimeStr, 4, 2), 0);
        TimeValue := EncodeTime(Hours, Minutes, 0, 0);
        // Apply coloring based on the threshold time
        if DayOfWeek = 'جمعه' then  // Friday
        begin
          if TimeValue > ThresholdTime then
            dbgrdDays.Canvas.Brush.Color := clLime;
        end
        else if TimeValue >= ThresholdTime then
          dbgrdDays.Canvas.Brush.Color := clLime  // Greater than threshold time
  //      else if TimeValue = ThresholdTime then
  //        dbgrdDays.Canvas.Brush.Color := clGreen  // Equal to threshold time
        else
          dbgrdDays.Canvas.Brush.Color := clFuchsia; // Less than threshold time
      end
      else
      begin
        // Default color for any other cases (e.g., invalid format)
        dbgrdDays.Canvas.Brush.Color := clWhite;
      end;
      // Draw the cell with the selected background color
      dbgrdDays.Canvas.FillRect(Rect);
      dbgrdDays.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    except
      exit;
    end;
  end;
end;

procedure TfMain.dbmmodescriptionsDblClick(Sender: TObject);
begin
  dbmmodescriptions.Enabled := not (dbmmodescriptions.Enabled);
end;

procedure TfMain.dsDaysStateChange(Sender: TObject);
begin
  if qryDays.State = dsEdit then
  begin
    dbmmodescriptions.Enabled := True;
    dbmmodescriptions.SetFocus;
  end
  else
  begin
    dbmmodescriptions.Enabled := False;
  end;
end;

procedure TfMain.dsTimeSheetStateChange(Sender: TObject);
begin
  if (qryTimeSheet.Active)and (qryTimeSheet.RecordCount = 0) then
  begin
    dbmmoTimeSheetDescriptions.Enabled := False;
    btnDeleteTimeSheet.Enabled := False;
//    btnTimeSheetEdit.Enabled:=False;
    Exit;
  end;
  if qryTimeSheet.State = dsEdit then
  begin
    dbmmoTimeSheetDescriptions.Enabled := True;
    dbmmoTimeSheetDescriptions.SetFocus;
  end
  else
  begin
    dbmmoTimeSheetDescriptions.Enabled := False;
  end;
  if qryTimeSheet.State in [dsEdit, dsInsert] then
  begin
    btnDeleteTimeSheet.Enabled := False;
  end
  else
  begin
    btnDeleteTimeSheet.Enabled := True;
  end;
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('Are you sure you want to exit?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    Application.Terminate
  else
    Action := caNone;  // Prevent the form from closing
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  qryDays.Active := True;
  qryTimeSheet.Active := True;
end;

procedure TfMain.FormShow(Sender: TObject);
begin
  RefreshGrid;
  qryDays.Last;
end;

procedure TfMain.qryDaysAfterScroll(DataSet: TDataSet);
begin
  if qryDays.RecordCount > 0 then
  begin
    qryTimeSheet.Parameters.ParamByName('day_id').Value := qryDays.FieldByName('id').AsInteger;
    with qryTimeSheet do
    begin
      close;
      Open;
    end;
    SetOutBtnEnableStatus;
  end;
end;

procedure TfMain.qryTimeSheetAfterScroll(DataSet: TDataSet);
begin
  SetOutBtnEnableStatus;
end;

end.

