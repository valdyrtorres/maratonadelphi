object FrmBusca: TFrmBusca
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Pesquisa'
  ClientHeight = 540
  ClientWidth = 728
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object lblTitulo: TLabel
    AlignWithMargins = True
    Left = 10
    Top = 0
    Width = 718
    Height = 42
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    AutoSize = False
    Caption = 'Pesquisa'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16744448
    Font.Height = -24
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    ExplicitLeft = -16
    ExplicitWidth = 624
  end
  object pBusca: TPanel
    AlignWithMargins = True
    Left = 10
    Top = 42
    Width = 708
    Height = 65
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 10
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Panel7: TPanel
      AlignWithMargins = True
      Left = 598
      Top = 10
      Width = 110
      Height = 45
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alRight
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 0
      object btnBusca: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 45
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Filtrar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnBuscaClick
        ExplicitLeft = 72
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object edtBusca: TEdit
      AlignWithMargins = True
      Left = 0
      Top = 10
      Width = 598
      Height = 45
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitHeight = 38
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 476
    Width = 728
    Height = 64
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      728
      64)
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 608
      Top = 8
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = 14869218
      ParentBackground = False
      TabOrder = 0
      object btnCancelar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5585461
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnCancelarClick
        ExplicitLeft = -6
        ExplicitTop = -8
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 483
      Top = 8
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 1
      object btnSelecionar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Selecionar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnSelecionarClick
        ExplicitLeft = -56
        ExplicitTop = -8
      end
    end
  end
  object grid: TDBGrid
    Left = 0
    Top = 107
    Width = 728
    Height = 369
    Align = alClient
    Color = clWhite
    DataSource = dsBusca
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Segoe UI Semibold'
    TitleFont.Style = [fsBold]
    OnDblClick = gridDblClick
  end
  object TabBusca: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 136
    Top = 176
  end
  object dsBusca: TDataSource
    DataSet = TabBusca
    Left = 312
    Top = 184
  end
end
