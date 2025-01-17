unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfLogin = class(TForm)
    pnl1: TPanel;
    pnlbuttons: TPanel;
    GridPanel1: TGridPanel;
    btnLogin: TButton;
    btnExit: TButton;
    pnlUname: TPanel;
    lbl2: TLabel;
    edtPassword: TEdit;
    pnlUname1: TPanel;
    lbl21: TLabel;
    edtUsername1: TEdit;
    procedure btnLoginClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

uses
  uMain, uDataModule;

{$R *.dfm}

procedure TfLogin.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfLogin.btnLoginClick(Sender: TObject);
var
  fMain: TfMain;
begin
  fLogin.Hide;
  fMain := TfMain.Create(Self);
  UserId:='1';
  with fMain do
  begin
    ShowModal;
    Free;
  end;

end;

procedure TfLogin.FormShow(Sender: TObject);
begin
  edtUsername1.SetFocus;
end;

end.

