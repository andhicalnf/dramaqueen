unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, uKaset, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, uLapJual, uKembali,uPenyewa, uPetugas, uSewa;

type
  TformMain = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Print1: TMenuItem;
    PrintSetup1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    Edit1: TMenuItem;
    Penyewa: TMenuItem;
    Petugas: TMenuItem;
    Help1: TMenuItem;
    Tutorial1: TMenuItem;
    About1: TMenuItem;
    FDConnection1: TFDConnection;
    Kaset: TMenuItem;
    Laporan1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    LaporanPenjualan1: TMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure KasetClick(Sender: TObject);
    procedure PenyewaClick(Sender: TObject);
    procedure PetugasClick(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure LaporanPenjualan1Click(Sender: TObject);

  private
    { Private declarations }
        procedure CreateFormKaset();
        procedure CreateFormPenyewa();
        procedure CreateFormPetugas();
        procedure CreateFormPenyewaan();
        procedure CreateFormKembali();
        procedure CreateFormLapJual();
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}
uses about;

procedure TformMain.About1Click(Sender: TObject);
begin
  TAboutBox.ShowMySelf;
end;
  (*AboutBox := TAboutBox.Create(Self); //constuctor
  AboutBox.ShowModal;
  AboutBox.Free;
end; *)

procedure TformMain.CreateFormKaset;
  var Child: TfrKaset;
begin
  child := TfrKaset.Create(Application);
end;

procedure TformMain.CreateFormKembali;
var Child: TfrKembali;
begin
  child := TfrKembali.Create(Application);
end;

procedure TformMain.CreateFormLapJual;
var Child: TfrLapJual;
begin
  child := TfrLapJual.Create(Application);
end;

procedure TformMain.CreateFormPenyewa;
var Child: TfrPenyewa;
begin
  child := TfrPenyewa.Create(Application);
end;

procedure TformMain.CreateFormPenyewaan;
var Child: TfrPenyewaan;
begin
  child := TfrPenyewaan.Create(Application);
end;

procedure TformMain.CreateFormPetugas;
var Child: TfrPetugas;
begin
  child := TfrPetugas.Create(Application);
end;

procedure TformMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TformMain.KasetClick(Sender: TObject);
begin
  CreateFormKaset();
end;

procedure TformMain.LaporanPenjualan1Click(Sender: TObject);
begin
  CreateFormLapJual();
end;

procedure TformMain.PenyewaClick(Sender: TObject);
begin
  CreateFormPenyewa();
end;

procedure TformMain.PetugasClick(Sender: TObject);
begin
  CreateFormPetugas();
end;

procedure TformMain.Print1Click(Sender: TObject);
begin
  CreateFormPenyewaan();
end;

procedure TformMain.PrintSetup1Click(Sender: TObject);
begin
  CreateFormKembali();
end;

end.
