object FrmClienteCad: TFrmClienteCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cliente'
  ClientHeight = 384
  ClientWidth = 521
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
    Caption = 'Novo Cliente'
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
    Left = 27
    Top = 86
    Width = 126
    Height = 13
    Margins.Left = 6
    AutoSize = False
    Caption = 'Nome'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    AlignWithMargins = True
    Left = 27
    Top = 158
    Width = 126
    Height = 13
    Margins.Left = 6
    AutoSize = False
    Caption = 'Endere'#231'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    AlignWithMargins = True
    Left = 371
    Top = 158
    Width = 107
    Height = 13
    Margins.Left = 6
    AutoSize = False
    Caption = 'Complemento'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    AlignWithMargins = True
    Left = 27
    Top = 230
    Width = 126
    Height = 13
    Margins.Left = 6
    AutoSize = False
    Caption = 'Bairro'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    AlignWithMargins = True
    Left = 437
    Top = 228
    Width = 46
    Height = 13
    Margins.Left = 6
    AutoSize = False
    Caption = 'UF'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    AlignWithMargins = True
    Left = 203
    Top = 230
    Width = 126
    Height = 13
    Margins.Left = 6
    AutoSize = False
    Caption = 'Cidade'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 390
    Top = 316
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 14869218
    ParentBackground = False
    TabOrder = 6
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
    Left = 268
    Top = 316
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 16475988
    ParentBackground = False
    TabOrder = 7
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
      ExplicitLeft = 72
      ExplicitTop = 8
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
  end
  object edtNome: TEdit
    Left = 25
    Top = 103
    Width = 469
    Height = 35
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtEndereco: TEdit
    Left = 25
    Top = 175
    Width = 328
    Height = 35
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edtComplemento: TEdit
    Left = 369
    Top = 175
    Width = 125
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
  object edtBairro: TEdit
    Left = 25
    Top = 247
    Width = 160
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
  object edtUF: TEdit
    Left = 432
    Top = 247
    Width = 62
    Height = 35
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object edtCidade: TEdit
    Left = 201
    Top = 247
    Width = 218
    Height = 35
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object TabClienteCad: TFDMemTable
    FieldDefs = <>
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
    Left = 365
    Top = 24
  end
end
