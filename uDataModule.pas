unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDataModule1 = class(TDataModule)
    MainConnection: TADOConnection;
    qry1: TADOQuery;
    cmd1: TADOCommand;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExecuteSql(strSql:string);
    procedure ExecuteSqlCommand(strSql:string);
    function GetUserId(sUsername:string;sPassword:string;bReturnTop:Boolean):string;
  end;

var
  DataModule1: TDataModule1;
  UserId: string;
implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.ExecuteSql(strSql: string);
begin
  with qry1 do
  begin
    sql.Clear;
    sql.Add(strSql);
    ExecSQL;
    Close;
    Open;
  end;
end;

procedure TDataModule1.ExecuteSqlCommand(strSql: string);
begin
  with cmd1 do
  begin
      CommandText:=strSql;
      Execute;
  end;
end;

function TDataModule1.GetUserId(sUsername, sPassword: string;
  bReturnTop: Boolean): string;
var
sQry:string;
sResult:string;
begin
  if bReturnTop  then
  begin
   sQry:='DECLARE @id INT SELECT TOP(1) @id=id FROM tblPersonel ORDER BY id SELECT @id AS Result';
   ExecuteSql(sQry);
  end
  else
  begin
    sQry:= 'DECLARE @id INT SELECT TOP(1) @id=id FROM tblPersonel WHERE Username=:userName and Password =:password ORDER BY id SELECT @id AS Result';
    with qry1 do
    begin
      sql.Clear;
      sql.Add(sQry);
      Parameters.ParamByName('username').Value:=sUsername;
      Parameters.ParamByName('password').Value:=sPassword;
      ExecSQL;
    end;
  end;
  if qry1.FieldByName('Result').AsString = '' then
    sResult:='0'
  else
    sResult:=qry1.FieldByName('Result').AsString;
  Result:=sResult;
end;

end.
