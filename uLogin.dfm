object fLogin: TfLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 132
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 296
    Height = 91
    Align = alClient
    TabOrder = 0
    object pnlUname: TPanel
      Left = 1
      Top = 42
      Width = 294
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lbl2: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 10
        Width = 53
        Height = 28
        Margins.Top = 10
        Align = alLeft
        Caption = 'Password '
        ExplicitHeight = 15
      end
      object edtPassword: TEdit
        AlignWithMargins = True
        Left = 64
        Top = 3
        Width = 227
        Height = 35
        Align = alRight
        TabOrder = 0
        ExplicitHeight = 23
      end
    end
    object pnlUname1: TPanel
      Left = 1
      Top = 1
      Width = 294
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lbl21: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 10
        Width = 56
        Height = 28
        Margins.Top = 10
        Align = alLeft
        Caption = 'User name'
        ExplicitHeight = 15
      end
      object edtUsername1: TEdit
        AlignWithMargins = True
        Left = 65
        Top = 3
        Width = 226
        Height = 35
        Align = alRight
        TabOrder = 0
        ExplicitHeight = 23
      end
    end
  end
  object pnlbuttons: TPanel
    Left = 0
    Top = 91
    Width = 296
    Height = 41
    Align = alBottom
    TabOrder = 1
    object GridPanel1: TGridPanel
      Left = 1
      Top = 1
      Width = 294
      Height = 39
      Align = alClient
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = btnLogin
          Row = 0
        end
        item
          Column = 1
          Control = btnExit
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 0
      object btnLogin: TButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 141
        Height = 33
        Align = alClient
        Caption = 'Login'
        ModalResult = 1
        TabOrder = 0
        OnClick = btnLoginClick
      end
      object btnExit: TButton
        AlignWithMargins = True
        Left = 150
        Top = 3
        Width = 141
        Height = 33
        Align = alClient
        Caption = 'Exit'
        ModalResult = 2
        TabOrder = 1
        OnClick = btnExitClick
      end
    end
  end
end
