object fTasks: TfTasks
  Left = 0
  Top = 0
  Caption = 'Tasks'
  ClientHeight = 463
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 15
  object pnlGrid: TPanel
    Left = 0
    Top = 41
    Width = 652
    Height = 191
    Align = alClient
    TabOrder = 0
    object grdpnlMain: TGridPanel
      Left = 1
      Top = 1
      Width = 650
      Height = 189
      Align = alClient
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
          Control = dbgrdTasks
          Row = 0
        end
        item
          Column = 1
          Control = grpComments
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 0
      object dbgrdTasks: TDBGrid
        Left = 1
        Top = 1
        Width = 324
        Height = 187
        Align = alClient
        DataSource = dsTasks
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbgrdTasksDblClick
      end
      object grpComments: TGroupBox
        Left = 325
        Top = 1
        Width = 324
        Height = 187
        Align = alClient
        Anchors = []
        Caption = 'comments'
        TabOrder = 1
        object Label1: TLabel
          Left = 104
          Top = 128
          Width = 52
          Height = 15
          Caption = 'comment'
          FocusControl = dbComment
        end
        object grdpnlMainComments: TGridPanel
          Left = 2
          Top = 17
          Width = 320
          Height = 143
          Align = alClient
          ColumnCollection = <
            item
              Value = 100.000000000000000000
            end>
          ControlCollection = <
            item
              Column = 0
              Control = dbComment
              Row = 1
            end
            item
              Column = 0
              Control = dbgrdComments
              Row = 0
            end>
          RowCollection = <
            item
              Value = 50.154658049270600000
            end
            item
              Value = 49.845341950729400000
            end>
          TabOrder = 0
          object dbComment: TDBMemo
            Left = 1
            Top = 72
            Width = 318
            Height = 70
            Align = alClient
            DataField = 'comment'
            DataSource = dsComments
            TabOrder = 0
          end
          object dbgrdComments: TDBGrid
            Left = 1
            Top = 1
            Width = 318
            Height = 71
            Align = alClient
            DataSource = dsComments
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDblClick = dbgrdCommentsDblClick
          end
        end
        object actComments: TActionToolBar
          Left = 2
          Top = 160
          Width = 320
          Height = 25
          ActionManager = actmgr1
          Align = alBottom
          Caption = 'actComments'
          Color = clMenuBar
          ColorMap.DisabledFontColor = 7171437
          ColorMap.HighlightColor = clWhite
          ColorMap.BtnSelectedFont = clBlack
          ColorMap.UnusedColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Spacing = 0
        end
      end
    end
  end
  object pnlControls: TPanel
    Left = 0
    Top = 422
    Width = 652
    Height = 41
    Align = alBottom
    TabOrder = 1
    object GridPanel1: TGridPanel
      Left = 1
      Top = 1
      Width = 650
      Height = 39
      Align = alClient
      ColumnCollection = <
        item
          Value = 11.069231053315940000
        end
        item
          Value = 11.124182344240360000
        end
        item
          Value = 11.124182344240360000
        end
        item
          Value = 11.124182344240360000
        end
        item
          Value = 11.124182344240360000
        end
        item
          Value = 11.124182344240360000
        end
        item
          Value = 11.124182344240360000
        end
        item
          Value = 11.124182344240360000
        end
        item
          Value = 11.061492537001560000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = btnAdd
          Row = 0
        end
        item
          Column = 1
          Control = btnEdit
          Row = 0
        end
        item
          Column = 2
          Control = btnDelete
          Row = 0
        end
        item
          Column = 3
          Control = btnCancel
          Row = 0
        end
        item
          Column = 4
          Control = btnSave
          Row = 0
        end
        item
          Column = 5
          Control = btnStart
          Row = 0
        end
        item
          Column = 6
          Control = btnFinish
          Row = 0
        end
        item
          Column = 8
          Control = btnBack
          Row = 0
        end
        item
          Column = 7
          Control = btnCopy
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 0
      object btnAdd: TButton
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 66
        Height = 31
        Action = DatasetInsert1
        Align = alClient
        TabOrder = 0
      end
      object btnEdit: TButton
        AlignWithMargins = True
        Left = 76
        Top = 4
        Width = 66
        Height = 31
        Action = DatasetEdit1
        Align = alClient
        TabOrder = 1
      end
      object btnDelete: TButton
        AlignWithMargins = True
        Left = 148
        Top = 4
        Width = 66
        Height = 31
        Action = DatasetDelete1
        Align = alClient
        TabOrder = 2
      end
      object btnCancel: TButton
        AlignWithMargins = True
        Left = 220
        Top = 4
        Width = 66
        Height = 31
        Action = DatasetCancel1
        Align = alClient
        TabOrder = 3
      end
      object btnSave: TButton
        AlignWithMargins = True
        Left = 292
        Top = 4
        Width = 66
        Height = 31
        Action = DatasetPost1
        Align = alClient
        TabOrder = 4
      end
      object btnStart: TButton
        AlignWithMargins = True
        Left = 364
        Top = 4
        Width = 66
        Height = 31
        Align = alClient
        Caption = '&Start'
        TabOrder = 5
        OnClick = btnStartClick
      end
      object btnFinish: TButton
        AlignWithMargins = True
        Left = 436
        Top = 4
        Width = 66
        Height = 31
        Align = alClient
        Caption = '&Finish'
        TabOrder = 6
        OnClick = btnFinishClick
      end
      object btnBack: TButton
        AlignWithMargins = True
        Left = 580
        Top = 4
        Width = 66
        Height = 31
        Hint = 'Close'
        Align = alClient
        Caption = 'C&lose'
        TabOrder = 7
        OnClick = WindowClose1Execute
      end
      object btnCopy: TButton
        AlignWithMargins = True
        Left = 508
        Top = 4
        Width = 66
        Height = 31
        Align = alClient
        Caption = 'Copy'
        TabOrder = 8
        OnClick = btnCopyClick
      end
    end
  end
  object pnlInputs: TPanel
    Left = 0
    Top = 232
    Width = 652
    Height = 190
    Align = alBottom
    TabOrder = 2
    object lblTtile: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 644
      Height = 15
      Align = alTop
      Caption = 'title'
      FocusControl = dbedttitle
      ExplicitWidth = 20
    end
    object lblDescription: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 104
      Width = 644
      Height = 15
      Align = alTop
      Caption = 'description'
      FocusControl = dbmmodescription
      ExplicitWidth = 59
    end
    object lbl: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 54
      Width = 644
      Height = 15
      Align = alTop
      Caption = 'due_date'
      FocusControl = dbedtdue_date
      ExplicitWidth = 48
    end
    object lblDayId: TLabel
      Left = 409
      Top = 109
      Width = 30
      Height = 15
      Caption = 'DayId'
      Visible = False
    end
    object dbedttitle: TDBEdit
      AlignWithMargins = True
      Left = 4
      Top = 25
      Width = 644
      Height = 23
      Align = alTop
      DataField = 'title'
      DataSource = dsTasks
      TabOrder = 0
      OnDblClick = dbedttitleDblClick
    end
    object dbmmodescription: TDBMemo
      AlignWithMargins = True
      Left = 4
      Top = 125
      Width = 644
      Height = 61
      Align = alClient
      DataField = 'description'
      DataSource = dsTasks
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object dbedtdue_date: TDBEdit
      AlignWithMargins = True
      Left = 4
      Top = 75
      Width = 644
      Height = 23
      Align = alTop
      DataField = 'due_date'
      DataSource = dsTasks
      TabOrder = 2
      OnDblClick = dbedtdue_dateDblClick
    end
    object edtDayId: TEdit
      Left = 408
      Top = 128
      Width = 105
      Height = 23
      ReadOnly = True
      TabOrder = 3
      Text = 'edtDayId'
      Visible = False
    end
  end
  object pnlSearchBox: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 41
    Align = alTop
    TabOrder = 3
    object SearchBox1: TSearchBox
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 640
      Height = 29
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      TabOrder = 0
      OnChange = SearchBox1Change
      ExplicitHeight = 23
    end
  end
  object qryTasks: TADOQuery
    Connection = DataModule1.MainConnection
    CursorType = ctStatic
    BeforeInsert = qryTasksBeforeInsert
    AfterInsert = qryTasksAfterInsert
    AfterEdit = qryTasksAfterInsert
    BeforePost = qryTasksBeforePost
    Parameters = <>
    SQL.Strings = (
      'SELECT [id]'
      '      ,[day_id]'
      '      ,[title]'
      '      ,[description]'
      '      ,[due_date]'
      '      ,[is_active]'
      
        '      ,FORMAT([created_at] ,'#39'yyyy/MM/dd hh:mm:ss'#39' ,'#39'fa'#39') AS crea' +
        'ted_at'
      
        '      ,FORMAT([updated_at] ,'#39'yyyy/MM/dd hh:mm:ss'#39' ,'#39'fa'#39') AS upda' +
        'ted_at'
      '      ,FORMAT([started_at] ,'#39' hh:mm:ss'#39' ,'#39'fa'#39') AS started_at'
      '      ,FORMAT([finished_at] ,'#39' hh:mm:ss'#39' ,'#39'fa'#39') AS finished_at'
      'FROM   [dbo].[tblTasks]'
      'WHERE 1 = 1')
    Left = 200
    Top = 256
    object qryTaskId: TAutoIncField
      DisplayWidth = 10
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object intgrfldTasksday_id: TIntegerField
      DisplayWidth = 10
      FieldName = 'day_id'
      Visible = False
    end
    object qryTaskstitle: TWideStringField
      DisplayLabel = 'Title'
      DisplayWidth = 50
      FieldName = 'title'
      Size = 128
    end
    object qryTasksdescription: TWideMemoField
      FieldName = 'description'
      Visible = False
      BlobType = ftWideMemo
    end
    object qryTasksdue_date: TStringField
      DisplayLabel = 'Due Date'
      DisplayWidth = 12
      FieldName = 'due_date'
      Size = 10
    end
    object qryTasksis_active: TBooleanField
      FieldName = 'is_active'
      Visible = False
    end
    object qryTasksstarted_at: TWideStringField
      DisplayLabel = 'Started at'
      DisplayWidth = 10
      FieldName = 'started_at'
      ReadOnly = True
      Size = 4000
    end
    object qryTasksfinished_at: TWideStringField
      DisplayLabel = 'Finished at'
      DisplayWidth = 10
      FieldName = 'finished_at'
      ReadOnly = True
      Size = 4000
    end
    object qryTaskscreated_at: TWideStringField
      DisplayLabel = 'Created at'
      DisplayWidth = 20
      FieldName = 'created_at'
      ReadOnly = True
      Size = 4000
    end
    object qryTasksupdated_at: TWideStringField
      FieldName = 'updated_at'
      ReadOnly = True
      Visible = False
      Size = 4000
    end
  end
  object dsTasks: TDataSource
    DataSet = qryTasks
    OnStateChange = dsTasksStateChange
    OnDataChange = dsTasksDataChange
    Left = 312
    Top = 256
  end
  object pmRightClick: TPopupMenu
    Left = 408
    Top = 256
    object Start1: TMenuItem
      Caption = 'Start'
    end
    object Start2: TMenuItem
      Caption = 'Finish'
    end
  end
  object actmgr1: TActionManager
    ActionBars = <
      item
        Items.CaptionOptions = coAll
        Items = <
          item
            Action = DatasetCancel1
            ImageIndex = 8
          end
          item
            Action = DatasetPost1
            ImageIndex = 7
          end
          item
            Action = DatasetEdit1
            ImageIndex = 6
          end
          item
            Action = DatasetDelete1
            ImageIndex = 5
          end
          item
            Action = DatasetInsert1
            ImageIndex = 4
          end>
      end
      item
        Items = <
          item
            Action = DatasetInsert2
            ImageIndex = 4
          end
          item
            Action = dtstdtComment
            ImageIndex = 6
          end
          item
            Action = dtstcnclComment
            ImageIndex = 8
          end
          item
            Action = DatasetDelete2
            ImageIndex = 5
          end
          item
            Action = dtstpstComment
            ImageIndex = 7
          end>
        ActionBar = actComments
      end>
    Left = 136
    Top = 105
    StyleName = 'Platform Default'
    object DatasetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insert'
      Hint = 'Insert'
      ImageIndex = 4
    end
    object DatasetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 5
      OnExecute = DatasetDelete1Execute
      DataSource = dsTasks
    end
    object DatasetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Edit'
      Hint = 'Edit'
      ImageIndex = 6
      DataSource = dsTasks
    end
    object DatasetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
    end
    object DatasetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
    end
    object WindowClose1: TWindowClose
      Category = 'Window'
      Caption = 'C&lose'
      Hint = 'Close'
      OnExecute = WindowClose1Execute
    end
    object DatasetInsert2: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insert'
      Hint = 'Insert'
      ImageIndex = 4
      DataSource = dsComments
    end
    object dtstdtComment: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Edit'
      Hint = 'Edit'
      ImageIndex = 6
      DataSource = dsComments
    end
    object DatasetDelete2: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 5
      DataSource = dsComments
    end
    object dtstpstComment: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
      DataSource = dsComments
    end
    object dtstcnclComment: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
      DataSource = dsComments
    end
  end
  object qryComments: TADOQuery
    Connection = DataModule1.MainConnection
    CursorType = ctStatic
    AfterInsert = qryCommentsAfterInsert
    BeforePost = qryCommentsBeforePost
    AfterPost = qryCommentsAfterPost
    BeforeDelete = qryCommentsBeforeDelete
    AfterDelete = qryCommentsAfterDelete
    OnNewRecord = qryCommentsNewRecord
    Parameters = <
      item
        Name = 'task_id'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT tc.[id]'
      '      ,tc.task_id'
      '      ,tc.comment'
      '      ,tc.person_id'
      
        '      ,FORMAT(tc.[created_at] ,'#39'yyyy/MM/dd hh:mm:ss'#39' ,'#39'fa'#39') AS c' +
        'reated_at'
      
        '      ,FORMAT(tc.[updated_at] ,'#39'yyyy/MM/dd hh:mm:ss'#39' ,'#39'fa'#39') AS u' +
        'pdated_at'
      
        '      ,CASE WHEN LEN(tc.comment)>30 THEN  SUBSTRING(tc.comment,1' +
        ',30) + '#39' ...'#39' ELSE tc.comment  END AS title'
      'FROM   [dbo].[tblTask_comments] tc'
      ''
      'WHERE task_id=:task_id')
    Left = 200
    Top = 184
    object qryCommentsid: TIntegerField
      FieldName = 'id'
      Visible = False
    end
    object qryCommentstask_id: TIntegerField
      FieldName = 'task_id'
      Visible = False
    end
    object qryCommentstitle: TWideMemoField
      DisplayLabel = 'Title'
      DisplayWidth = 30
      FieldName = 'title'
      ReadOnly = True
      BlobType = ftWideMemo
      DisplayValue = dvFull
    end
    object qryCommentscomment: TMemoField
      DisplayLabel = 'Comment'
      FieldName = 'comment'
      Visible = False
      BlobType = ftMemo
    end
    object qryCommentsperson_id: TIntegerField
      DisplayLabel = 'Person_Id'
      FieldName = 'person_id'
      Visible = False
    end
    object qryCommentscreated_at: TWideStringField
      DisplayLabel = 'Created_at'
      FieldName = 'created_at'
      ReadOnly = True
    end
    object qryCommentsupdated_at: TWideStringField
      DisplayLabel = 'Updated_at'
      FieldName = 'updated_at'
      ReadOnly = True
    end
  end
  object dsComments: TDataSource
    DataSet = qryComments
    OnStateChange = dsCommentsStateChange
    Left = 200
    Top = 328
  end
end
