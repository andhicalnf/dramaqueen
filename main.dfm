object formMain: TformMain
  Left = 0
  Top = 0
  Caption = 'formMain'
  ClientHeight = 531
  ClientWidth = 735
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  DesignSize = (
    735
    531)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 86
    Top = 24
    Width = 624
    Height = 33
    Anchors = [akTop]
    Caption = 'WELCOME TO QUEEN OF DAFTAR NOMINATIF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 382
    Top = 63
    Width = 190
    Height = 23
    Anchors = [akTop]
    Caption = 'a specialist drama'#39's rent'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -20
    Font.Name = 'Mistral'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object MainMenu1: TMainMenu
    Left = 576
    Top = 200
    object File1: TMenuItem
      Caption = '&Transaksi'
      object Print1: TMenuItem
        Caption = '&Penyewaan'
        OnClick = Print1Click
      end
      object PrintSetup1: TMenuItem
        Caption = 'P&engembalian'
        OnClick = PrintSetup1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Edit1: TMenuItem
      Caption = '&Data'
      object Penyewa: TMenuItem
        Caption = 'Penyewa'
        OnClick = PenyewaClick
      end
      object Petugas: TMenuItem
        Caption = '&Petugas'
        OnClick = PetugasClick
      end
      object Kaset: TMenuItem
        Caption = 'Kaset'
        OnClick = KasetClick
      end
    end
    object Laporan1: TMenuItem
      Caption = '&Laporan'
      object LaporanPenjualan1: TMenuItem
        Caption = 'Laporan Penjualan'
        OnClick = LaporanPenjualan1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object Tutorial1: TMenuItem
        Caption = '&Tutorial'
      end
      object About1: TMenuItem
        Caption = '&About...'
        OnClick = About1Click
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=dvd'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    Left = 576
    Top = 120
  end
end
