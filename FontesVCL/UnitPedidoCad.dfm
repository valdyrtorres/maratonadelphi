object FrmPedidoCad: TFrmPedidoCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Pedido'
  ClientHeight = 520
  ClientWidth = 698
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
    Left = 25
    Top = 20
    Width = 249
    Height = 42
    Margins.Left = 0
    Margins.Top = 15
    Margins.Right = 0
    Margins.Bottom = 15
    AutoSize = False
    Caption = 'Novo Pedido'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16744448
    Font.Height = -24
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    AlignWithMargins = True
    Left = 25
    Top = 76
    Width = 56
    Height = 13
    Margins.Left = 6
    AutoSize = False
    Caption = 'Cliente'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    AlignWithMargins = True
    Left = 525
    Top = 76
    Width = 56
    Height = 13
    Margins.Left = 6
    AutoSize = False
    Caption = 'Dt. Pedido'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblTotal: TLabel
    AlignWithMargins = True
    Left = 469
    Top = 427
    Width = 209
    Height = 42
    Margins.Left = 0
    Margins.Top = 15
    Margins.Right = 0
    Margins.Bottom = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Total: R$ 0,00'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16744448
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label3: TLabel
    AlignWithMargins = True
    Left = 25
    Top = 139
    Width = 209
    Height = 42
    Margins.Left = 0
    Margins.Top = 15
    Margins.Right = 0
    Margins.Bottom = 15
    AutoSize = False
    Caption = 'Produtos'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16744448
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 568
    Top = 471
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
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
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelarClick
      ExplicitLeft = -6
      ExplicitTop = -8
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 443
    Top = 471
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 16475988
    ParentBackground = False
    TabOrder = 1
    object btnSalvar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Salvar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnSalvarClick
      ExplicitHeight = 41
    end
  end
  object edtIdcliente: TEdit
    Left = 25
    Top = 95
    Width = 56
    Height = 35
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object edtCliente: TEdit
    Left = 87
    Top = 95
    Width = 432
    Height = 35
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object dtPedido: TDateTimePicker
    Left = 525
    Top = 95
    Width = 153
    Height = 33
    Date = 45528.000000000000000000
    Time = 0.574596400459995500
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object gridItens: TDBGrid
    Left = 25
    Top = 187
    Width = 653
    Height = 246
    BorderStyle = bsNone
    Color = clWhite
    DataSource = dsItens
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id_item'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'id_produto'
        Title.Caption = 'Id. Produto'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtd'
        Title.Caption = 'Qtd'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_unitario'
        Title.Caption = 'Vl. Unit'#225'rio'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_total'
        Title.Caption = 'Vl. Total'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 25
    Top = 447
    Width = 95
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 16475988
    ParentBackground = False
    TabOrder = 7
    object btnNovo: TSpeedButton
      Left = 0
      Top = 0
      Width = 95
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Inserir Item'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnNovoClick
      ExplicitLeft = -3
      ExplicitTop = -8
      ExplicitWidth = 110
    end
  end
  object Panel6: TPanel
    AlignWithMargins = True
    Left = 135
    Top = 447
    Width = 95
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 16475988
    ParentBackground = False
    TabOrder = 8
    object btnEditar: TSpeedButton
      Left = 0
      Top = 0
      Width = 95
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Editar Item'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnEditarClick
      ExplicitLeft = -12
      ExplicitTop = -8
      ExplicitWidth = 110
    end
  end
  object Panel7: TPanel
    AlignWithMargins = True
    Left = 245
    Top = 447
    Width = 95
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 16475988
    ParentBackground = False
    TabOrder = 9
    object btnExcluir: TSpeedButton
      Left = 0
      Top = 0
      Width = 95
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Excluir Item'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnExcluirClick
      ExplicitLeft = -12
      ExplicitTop = -8
      ExplicitWidth = 110
    end
  end
  object pItem: TPanel
    Left = 8
    Top = 8
    Width = 682
    Height = 504
    Color = clWhite
    ParentBackground = False
    TabOrder = 6
    Visible = False
    object Label4: TLabel
      AlignWithMargins = True
      Left = 26
      Top = 8
      Width = 209
      Height = 42
      Margins.Left = 0
      Margins.Top = 15
      Margins.Right = 0
      Margins.Bottom = 15
      AutoSize = False
      Caption = 'Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = 16744448
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label5: TLabel
      AlignWithMargins = True
      Left = 26
      Top = 169
      Width = 71
      Height = 13
      Margins.Left = 6
      AutoSize = False
      Caption = 'Id. Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5585461
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      AlignWithMargins = True
      Left = 121
      Top = 169
      Width = 71
      Height = 13
      Margins.Left = 6
      AutoSize = False
      Caption = 'Descri'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5585461
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      AlignWithMargins = True
      Left = 368
      Top = 169
      Width = 33
      Height = 13
      Margins.Left = 6
      AutoSize = False
      Caption = 'Qtd'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5585461
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      AlignWithMargins = True
      Left = 467
      Top = 169
      Width = 65
      Height = 13
      Margins.Left = 6
      AutoSize = False
      Caption = 'Vl. Unit'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5585461
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      AlignWithMargins = True
      Left = 563
      Top = 169
      Width = 65
      Height = 13
      Margins.Left = 6
      AutoSize = False
      Caption = 'Vl. Total'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5585461
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 165
      Top = 257
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 0
      object btnSalvarItem: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Salvar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnSalvarItemClick
        ExplicitLeft = -48
        ExplicitTop = -16
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 331
      Top = 257
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 14869218
      ParentBackground = False
      TabOrder = 1
      object btnCancelarItem: TSpeedButton
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
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnCancelarItemClick
        ExplicitLeft = -6
        ExplicitTop = -8
      end
    end
    object DBEdit1: TDBEdit
      Left = 26
      Top = 188
      Width = 86
      Height = 29
      DataField = 'id_produto'
      DataSource = dsItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 118
      Top = 188
      Width = 244
      Height = 29
      DataField = 'descricao'
      DataSource = dsItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 368
      Top = 188
      Width = 90
      Height = 29
      DataField = 'qtd'
      DataSource = dsItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 464
      Top = 188
      Width = 90
      Height = 29
      DataField = 'vl_unitario'
      DataSource = dsItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object DBEdit5: TDBEdit
      Left = 560
      Top = 188
      Width = 96
      Height = 29
      DataField = 'vl_total'
      DataSource = dsItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object TabPedidoCad: TFDMemTable
    FieldDefs = <
      item
        Name = 'id_pedido'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'dt_pedido'
        DataType = ftDate
      end
      item
        Name = 'vl_total'
        DataType = ftCurrency
      end
      item
        Name = 'usuario'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'id_cliente'
        DataType = ftInteger
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 312
    Top = 16
    object TabPedidoCadid_pedido: TIntegerField
      FieldName = 'id_pedido'
    end
    object TabPedidoCadid_cliente: TIntegerField
      FieldName = 'id_cliente'
    end
    object TabPedidoCaddt_pedido: TDateField
      FieldName = 'dt_pedido'
    end
    object TabPedidoCadvl_total: TFloatField
      FieldName = 'vl_total'
      currency = True
    end
    object TabPedidoCadnome: TStringField
      FieldName = 'nome'
    end
    object TabPedidoCadcidade: TStringField
      FieldName = 'cidade'
    end
    object TabPedidoCadusuario: TStringField
      FieldName = 'usuario'
    end
  end
  object TabItens: TFDMemTable
    FieldDefs = <
      item
        Name = 'id_item'
        DataType = ftInteger
      end
      item
        Name = 'id_produto'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'qtd'
        DataType = ftInteger
      end
      item
        Name = 'vl_unitario'
        DataType = ftFloat
      end
      item
        Name = 'vl_total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 48
    Top = 352
    object TabItensid_item: TIntegerField
      FieldName = 'id_item'
    end
    object TabItensid_produto: TIntegerField
      FieldName = 'id_produto'
    end
    object TabItensdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object TabItensqtd: TIntegerField
      FieldName = 'qtd'
    end
    object TabItensvl_unitario: TFloatField
      FieldName = 'vl_unitario'
      DisplayFormat = '#,##0.00'
    end
    object TabItensvl_total: TFloatField
      FieldName = 'vl_total'
      DisplayFormat = '#,##0.00'
    end
  end
  object dsItens: TDataSource
    DataSet = TabItens
    Left = 48
    Top = 288
  end
end
