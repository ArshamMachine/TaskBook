object fMain: TfMain
  Left = 0
  Top = 0
  Margins.Left = 10
  Caption = 'TaskBook'
  ClientHeight = 468
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlGrid: TPanel
    Left = 161
    Top = 0
    Width = 489
    Height = 468
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 309
    ExplicitHeight = 432
    object rzclcksts1: TRzClockStatus
      AlignWithMargins = True
      Left = 3
      Top = 301
      Width = 483
      Align = alBottom
      ExplicitLeft = 80
      ExplicitTop = 412
      ExplicitWidth = 150
    end
    object dbgrdDays: TDBGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 278
      Height = 292
      Align = alLeft
      DataSource = dsDays
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = dbgrdDaysDblClick
    end
    object pnlInput: TPanel
      Left = 0
      Top = 324
      Width = 489
      Height = 144
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 288
      ExplicitWidth = 309
      object lblDescriptions: TLabel
        Left = 1
        Top = 1
        Width = 487
        Height = 15
        Align = alTop
        Caption = 'descriptions'
        FocusControl = dbmmodescriptions
        ExplicitWidth = 64
      end
      object dbmmodescriptions: TDBMemo
        AlignWithMargins = True
        Left = 11
        Top = 19
        Width = 467
        Height = 73
        Margins.Left = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        DataField = 'descriptions'
        DataSource = dsDays
        TabOrder = 0
        OnDblClick = dbmmodescriptionsDblClick
        ExplicitWidth = 287
      end
      object pnlbtns: TPanel
        Left = 1
        Top = 102
        Width = 487
        Height = 41
        Align = alBottom
        TabOrder = 1
        ExplicitWidth = 307
        object grdpnl1: TGridPanel
          Left = 1
          Top = 1
          Width = 485
          Height = 39
          Align = alClient
          ColumnCollection = <
            item
              Value = 33.382182211859500000
            end
            item
              Value = 33.447896208139110000
            end
            item
              Value = 33.169921580001390000
            end>
          ControlCollection = <
            item
              Column = 0
              Control = btnEdit
              Row = 0
            end
            item
              Column = 1
              Control = btnCancel
              Row = 0
            end
            item
              Column = 2
              Control = btnPost
              Row = 0
            end>
          RowCollection = <
            item
              Value = 100.000000000000000000
            end>
          TabOrder = 0
          ExplicitWidth = 305
          object btnEdit: TButton
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 155
            Height = 31
            Action = dtstdt
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 95
          end
          object btnCancel: TButton
            AlignWithMargins = True
            Left = 165
            Top = 4
            Width = 156
            Height = 31
            Action = dtstcncl
            Align = alClient
            TabOrder = 1
            ExplicitLeft = 105
            ExplicitWidth = 95
          end
          object btnPost: TButton
            AlignWithMargins = True
            Left = 327
            Top = 4
            Width = 154
            Height = 31
            Action = dtstpst
            Align = alClient
            TabOrder = 2
            ExplicitLeft = 206
            ExplicitWidth = 95
          end
        end
      end
    end
    object grpTimeSheet: TGroupBox
      Left = 284
      Top = 0
      Width = 205
      Height = 298
      Align = alClient
      Caption = 'Time Sheet'
      TabOrder = 2
      ExplicitLeft = 324
      ExplicitWidth = 143
      ExplicitHeight = 262
      object dbgrdTimeSheet: TDBGrid
        Left = 2
        Top = 17
        Width = 201
        Height = 133
        Align = alClient
        DataSource = dsTimeSheet
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object grpDescriptions: TGroupBox
        Left = 2
        Top = 150
        Width = 201
        Height = 105
        Align = alBottom
        Caption = 'discriptions'
        TabOrder = 1
        ExplicitLeft = 48
        ExplicitTop = 224
        ExplicitWidth = 185
        object dbmmoTimeSheetDescriptions: TDBMemo
          AlignWithMargins = True
          Left = 5
          Top = 20
          Width = 191
          Height = 80
          Align = alClient
          DataField = 'descriptions'
          DataSource = dsTimeSheet
          TabOrder = 0
          ExplicitLeft = 24
          ExplicitTop = 40
          ExplicitWidth = 185
          ExplicitHeight = 89
        end
      end
      object pnlbtnstimesheet: TPanel
        Left = 2
        Top = 255
        Width = 201
        Height = 41
        Align = alBottom
        TabOrder = 2
        ExplicitLeft = 1
        ExplicitTop = 102
        ExplicitWidth = 307
        object grdpnl11: TGridPanel
          Left = 1
          Top = 1
          Width = 199
          Height = 39
          Align = alClient
          ColumnCollection = <
            item
              Value = 25.813715866457340000
            end
            item
              Value = 24.952284611707650000
            end
            item
              Value = 24.501663670016380000
            end
            item
              Value = 24.732335851818630000
            end>
          ControlCollection = <
            item
              Column = 0
              Control = btnTimeSheetEdit
              Row = 0
            end
            item
              Column = 1
              Control = btnTimeSheetCancel
              Row = 0
            end
            item
              Column = 3
              Control = btnTimeSheetPost
              Row = 0
            end
            item
              Column = 2
              Control = btnDeleteTimeSheet
              Row = 0
            end>
          RowCollection = <
            item
              Value = 100.000000000000000000
            end>
          TabOrder = 0
          ExplicitWidth = 177
          object btnTimeSheetEdit: TButton
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 45
            Height = 31
            Action = actEditTimeSheet
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 148
          end
          object btnTimeSheetCancel: TButton
            AlignWithMargins = True
            Left = 55
            Top = 4
            Width = 43
            Height = 31
            Action = actCancelTimeSheet
            Align = alClient
            TabOrder = 1
            ExplicitLeft = 158
            ExplicitWidth = 148
          end
          object btnTimeSheetPost: TButton
            AlignWithMargins = True
            Left = 152
            Top = 4
            Width = 43
            Height = 31
            Action = actPostTimeSheet
            Align = alClient
            TabOrder = 2
            ExplicitLeft = 312
            ExplicitWidth = 147
          end
          object btnDeleteTimeSheet: TButton
            AlignWithMargins = True
            Left = 104
            Top = 4
            Width = 42
            Height = 31
            Hint = 'Delete'
            Align = alClient
            Caption = '&Delete'
            ImageIndex = 5
            TabOrder = 3
            OnClick = btnDeleteTimeSheetClick
            ExplicitLeft = 160
            ExplicitTop = 24
            ExplicitWidth = 75
            ExplicitHeight = 25
          end
        end
      end
    end
  end
  object pnlControls: TPanel
    Left = 0
    Top = 0
    Width = 161
    Height = 468
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitHeight = 432
    object GridPanel1: TGridPanel
      Left = 0
      Top = 0
      Width = 161
      Height = 468
      Align = alClient
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = btnAdd
          Row = 0
        end
        item
          Column = 0
          Control = btnExit
          Row = 5
        end
        item
          Column = 0
          Control = btnShowDay
          Row = 2
        end
        item
          Column = 0
          Control = btnFinish
          Row = 1
        end
        item
          Column = 0
          Control = btnSetTimesheetIn
          Row = 3
        end
        item
          Column = 0
          Control = btnTimeSheetOut
          Row = 4
        end>
      RowCollection = <
        item
          Value = 16.034112942870250000
        end
        item
          Value = 16.087587839511020000
        end
        item
          Value = 16.325124379763310000
        end
        item
          Value = 16.710697176483140000
        end
        item
          Value = 17.184843664778710000
        end
        item
          Value = 17.657633996593580000
        end>
      TabOrder = 0
      ExplicitHeight = 432
      object btnAdd: TButton
        AlignWithMargins = True
        Left = 11
        Top = 11
        Width = 139
        Height = 55
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Caption = 'Add Today'
        TabOrder = 0
        OnClick = btnAddClick
        ExplicitHeight = 67
      end
      object btnExit: TButton
        AlignWithMargins = True
        Left = 11
        Top = 395
        Width = 139
        Height = 62
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Caption = 'Exit'
        TabOrder = 1
        OnClick = btnExitClick
        ExplicitLeft = 19
        ExplicitTop = 371
        ExplicitHeight = 54
      end
      object btnShowDay: TButton
        AlignWithMargins = True
        Left = 11
        Top = 161
        Width = 139
        Height = 56
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Caption = 'Show'
        TabOrder = 2
        ExplicitTop = 194
        ExplicitHeight = 67
      end
      object btnFinish: TButton
        AlignWithMargins = True
        Left = 11
        Top = 86
        Width = 139
        Height = 55
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Caption = 'Finish Today'
        TabOrder = 3
        OnClick = btnFinishClick
        ExplicitTop = 98
        ExplicitHeight = 68
      end
      object btnSetTimesheetIn: TButton
        AlignWithMargins = True
        Left = 11
        Top = 237
        Width = 139
        Height = 58
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Caption = 'IN'
        TabOrder = 4
        OnClick = btnSetTimesheetInClick
        ExplicitLeft = 56
        ExplicitTop = 272
        ExplicitWidth = 75
        ExplicitHeight = 25
      end
      object btnTimeSheetOut: TButton
        AlignWithMargins = True
        Left = 11
        Top = 315
        Width = 139
        Height = 60
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Caption = 'OUT'
        TabOrder = 5
        OnClick = btnTimeSheetOutClick
        ExplicitLeft = 72
        ExplicitTop = 312
        ExplicitWidth = 75
        ExplicitHeight = 25
      end
    end
  end
  object qryDays: TADOQuery
    Active = True
    Connection = DataModule1.MainConnection
    CursorType = ctStatic
    AfterScroll = qryDaysAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT id,'
      '       td.person_id,'
      
        '       FORMAT(td.working_date, '#39'yyyy/MM/dd'#39', '#39'fa'#39') AS working_da' +
        'te,'
      '       FORMAT(td.started_at, '#39'hh:mm:ss'#39', '#39'fa'#39') AS started_at,'
      '       FORMAT(td.finished_at, '#39'HH:mm:ss'#39', '#39'fa'#39') AS finished_at,'
      '       td.descriptions'
      'FROM   tblDays AS td'
      'WHERE  td.person_id = 1')
    Left = 208
    Top = 128
    object qryDaysid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object qryDays_person_id: TIntegerField
      FieldName = 'person_id'
      Visible = False
    end
    object qryDaysworking_date: TWideStringField
      DisplayLabel = 'Date'
      DisplayWidth = 12
      FieldName = 'working_date'
      ReadOnly = True
      Size = 4000
    end
    object qryDaysstarted_at: TWideStringField
      DisplayLabel = 'Start Time'
      DisplayWidth = 15
      FieldName = 'started_at'
      ReadOnly = True
      Size = 4000
    end
    object qryDaysfinished_at: TWideStringField
      DisplayLabel = 'Finish Time'
      DisplayWidth = 15
      FieldName = 'finished_at'
      ReadOnly = True
      Size = 4000
    end
    object qryDaysdescriptions: TWideMemoField
      FieldName = 'descriptions'
      Visible = False
      BlobType = ftWideMemo
    end
  end
  object dsDays: TDataSource
    DataSet = qryDays
    OnStateChange = dsDaysStateChange
    Left = 329
    Top = 144
  end
  object actmgr1: TActionManager
    Left = 280
    Top = 184
    StyleName = 'Platform Default'
    object actEditTimeSheet: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Edit'
      Hint = 'Edit'
      ImageIndex = 6
      DataSource = dsTimeSheet
    end
    object actPostTimeSheet: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
      DataSource = dsTimeSheet
    end
    object actCancelTimeSheet: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
      DataSource = dsTimeSheet
    end
    object act: TAction
      Caption = 'act'
    end
    object dtstdt: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Edit'
      Hint = 'Edit'
      ImageIndex = 6
      DataSource = dsDays
    end
    object dtstpst: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
      DataSource = dsDays
    end
    object dtstcncl: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
      DataSource = dsDays
    end
    object actDeleteTimeSheet: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 5
      DataSource = dsTimeSheet
    end
  end
  object qryTimeSheet: TADOQuery
    Connection = DataModule1.MainConnection
    CursorType = ctStatic
    AfterScroll = qryTimeSheetAfterScroll
    AfterRefresh = qryTimeSheetAfterScroll
    Parameters = <
      item
        Name = 'day_id'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT id,'
      '       day_id,'
      '       FORMAT(in_time, '#39'HH:mm:ss'#39', '#39'en'#39') AS in_time,'
      '       FORMAT(out_time, '#39'HH:mm:ss'#39', '#39'en'#39') AS out_time,'
      '       descriptions'
      'FROM   tbltimesheet'
      'WHERE Day_id=:day_id')
    Left = 525
    Top = 112
    object qryTimeSheetid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object qryTimeSheetday_id: TIntegerField
      FieldName = 'day_id'
      Visible = False
    end
    object qryTimeSheetin_time: TWideStringField
      DisplayLabel = 'IN'
      DisplayWidth = 10
      FieldName = 'in_time'
      ReadOnly = True
      Size = 4000
    end
    object qryTimeSheetout_time: TWideStringField
      DisplayLabel = 'OUT'
      DisplayWidth = 10
      FieldName = 'out_time'
      ReadOnly = True
      Size = 4000
    end
    object qryTimeSheetdescriptions: TWideMemoField
      FieldName = 'descriptions'
      Visible = False
      BlobType = ftWideMemo
    end
  end
  object dsTimeSheet: TDataSource
    DataSet = qryTimeSheet
    OnStateChange = dsTimeSheetStateChange
    Left = 509
    Top = 32
  end
end