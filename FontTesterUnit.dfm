object formFT: TformFT
  Left = 0
  Top = 0
  Caption = 'Font Tester :)'
  ClientHeight = 339
  ClientWidth = 242
  Color = clBtnFace
  ParentFont = True
  KeyPreview = True
  Menu = Menu
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labelTest: TLabel
    Left = 0
    Top = 248
    Width = 241
    Height = 89
    Alignment = taCenter
    AutoSize = False
    Caption = 'Test Applied Font...'
    Layout = tlCenter
  end
  object formRichestEdit: TRichestEdit
    Left = 8
    Top = 8
    Width = 226
    Height = 89
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PlainText = True
    TabOrder = 0
  end
  object formFontBox: TFontBox
    Left = 9
    Top = 103
    Width = 225
    Height = 21
    TabOrder = 1
    Items.Strings = (
      '@Dotum'
      '@DotumChe'
      '@Gulim'
      '@GulimChe'
      '@MingLiU'
      '@MS Gothic'
      '@MS Mincho'
      '@MS PGothic'
      '@MS PMincho'
      '@MS UI Gothic'
      '@NSimSun'
      '@PMingLiU'
      '@SimHei'
      '@SimSun'
      '@SimSun-PUA'
      '@Terminal'
      'Arial'
      'Arial Black'
      'Arial Narrow'
      'Book Antiqua'
      'Bookman Old Style'
      'Calibri'
      'Cambria'
      'Cambria Math'
      'Candara'
      'Comic Sans MS'
      'Constantia'
      'Corbel'
      'Courier'
      'Courier New'
      'Default'
      'DejaVu Sans Mono'
      'Dotum'
      'DotumChe'
      'Fixedsys'
      'Franklin Gothic Medium'
      'Garamond'
      'Georgia'
      'Gulim'
      'GulimChe'
      'Impact'
      'Lucida Console'
      'Lucida Sans'
      'Lucida Sans Unicode'
      'Marlett'
      'Microsoft Sans Serif'
      'MingLiU'
      'Modern'
      'Monotype Corsiva'
      'MS Gothic'
      'MS Mincho'
      'MS PGothic'
      'MS PMincho'
      'MS Reference Sans Serif'
      'MS Reference Specialty'
      'MS Sans Serif'
      'MS Serif'
      'MS UI Gothic'
      'NSimSun'
      'Palatino Linotype'
      'PMingLiU'
      'Roman'
      'Script'
      'Segoe UI'
      'SimHei'
      'SimSun'
      'SimSun-PUA'
      'Sylfaen'
      'Symbol'
      'System'
      'Tahoma'
      'Terminal'
      'Times New Roman'
      'Trebuchet MS'
      'Verdana'
      'Vrinda'
      'WST_Czec'
      'WST_Engl'
      'WST_Fren'
      'WST_Germ'
      'WST_Ital'
      'WST_Span'
      'WST_Swed')
    Test = False
  end
  object butApplyS: TButton
    Left = 9
    Top = 130
    Width = 225
    Height = 25
    Caption = 'Apply Font From Input (F1)!'
    TabOrder = 2
    OnClick = butApplySClick
  end
  object butApplyI: TButton
    Left = 8
    Top = 160
    Width = 226
    Height = 25
    Caption = 'Apply Font From Combobox (F3)!'
    TabOrder = 3
    OnClick = butApplyIClick
  end
  object butDelete: TButton
    Left = 8
    Top = 223
    Width = 226
    Height = 25
    Caption = 'Delete Selected Font (F9)!'
    TabOrder = 4
    OnClick = butDeleteClick
  end
  object butAdd: TButton
    Left = 8
    Top = 192
    Width = 226
    Height = 25
    Caption = 'Add A New Font (F5)!'
    TabOrder = 5
    OnClick = butAddClick
  end
  object Menu: TMainMenu
    Left = 8
    Top = 8
    object MenuConfig: TMenuItem
      Caption = 'Config'
      object SubLanguage: TMenuItem
        Caption = 'Language'
        object SubEnglish: TMenuItem
          Caption = 'English'
          Checked = True
          Default = True
          OnClick = SubEnglishClick
        end
        object SubSrpski: TMenuItem
          Caption = 'Srpski'
          OnClick = SubSrpskiClick
        end
      end
      object SubExit: TMenuItem
        Caption = 'Exit'
        ShortCut = 27
      end
    end
  end
  object Open: TOpenDialog
    Filter = 'TrueType Font|*.ttf|Font|*.fon|OpenType Font|*.otf'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing, ofForceShowHidden]
    Left = 48
    Top = 8
  end
end
