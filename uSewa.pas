unit uSewa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
  TfrPenyewaan = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    edNoSewa: TEdit;
    edPetugas: TEdit;
    edNamaSewa: TEdit;
    edJudul: TEdit;
    edQty: TEdit;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    FDTable1: TFDTable;
    edTanggalSewa: TDateTimePicker;
    FDTable1no_sewa: TIntegerField;
    FDTable1id_dvd: TStringField;
    FDTable1judul: TStringField;
    FDTable1qty: TIntegerField;
    FDTable1harga: TIntegerField;
    FDTable1id_penyewa: TStringField;
    FDTable1tgl_sewa: TDateField;
    FDTable1nama_petugas: TStringField;
    FDTable1nama_penyewa: TStringField;
    FDTable1jumlah: TIntegerField;
    FDTable1kembali: TIntegerField;
    FDTable1bayar: TIntegerField;
    FDTable1total: TAggregateField;
    Image1: TImage;
    DBGrid2: TDBGrid;
    procedure edQtyKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edPetugasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edJudulKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNamaSewaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDTable1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPenyewaan: TfrPenyewaan;

implementation

{$R *.dfm}

procedure TfrPenyewaan.edJudulKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
  begin
   FDQuery1.IndexFieldNames := 'judul';
    if FDQuery1.Locate('judul', edJudul.Text, []) then
       begin
          edJudul.Text := FDQuery1.FieldByName('judul').AsString;
       end
    else
       ShowMessage('Judul tidak ditemukan');
    Key := 0 ;
    edQty.SetFocus;
  end;
end;

procedure TfrPenyewaan.edNamaSewaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
  begin
   FDQuery3.IndexFieldNames := 'nama_penyewa';
    if FDQuery3.Locate('nama_penyewa', edNamaSewa.Text, []) then
       begin
          edNamaSewa.Text := FDQuery3.FieldByName('nama_penyewa').AsString;
       end
    else
       ShowMessage('Penyewa tidak ditemukan');
    Key := 0 ;
    edJudul.SetFocus;
  end;
end;

procedure TfrPenyewaan.edPetugasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
  begin
   FDQuery2.IndexFieldNames := 'id_petugas';
    if FDQuery2.Locate('id_petugas', edPetugas.Text, []) then
       begin
          edPetugas.Text := FDQuery2.FieldByName('nama_petugas').AsString;
          edNamaSewa.SetFocus;
       end
    else
       ShowMessage('ID Petugas tidak ditemukan');
    Key := 0 ;
  end;
end;

procedure TfrPenyewaan.edQtyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_Return then
  begin
 if FDQuery1.FieldByName('stok').AsInteger>StrToInt(edQty.Text)then
  begin
    FDTable1.Append;
    FDTable1.FieldByName('no_sewa').AsString := edNoSewa.Text;
    FDTable1.FieldByName('nama_petugas').AsString := FDQuery2.FieldByName('nama_petugas').AsString;
    FDTable1.FieldByName('nama_penyewa').AsString := FDQuery3.FieldByName('nama_penyewa').AsString;
    FDTable1.FieldByName('tgl_sewa').AsDateTime := VartoDateTime(edTanggalSewa.Date);
    FDTable1.FieldByName('id_dvd').AsString := FDQuery1.FieldByName('id_dvd').AsString;
    FDTable1.FieldByName('id_penyewa').AsString := FDQuery3.FieldByName('id_penyewa').AsString;
    FDTable1.FieldByName('judul').AsString:= FDQuery1.FieldByName('judul').AsString;
    FDTable1.FieldByName('qty').AsInteger := StrToInt (edQty.Text);
    FDTable1.FieldByName('harga').AsInteger := FDQuery1.FieldByName('hargasewa').AsInteger;
    FDTable1.Post;
  end
else
  ShowMessage('Data Tidak Ada');
  edJudul.Text := '';
  edQty.Text := '';
  edJudul.SetFocus;
  Key :=0;
  end;
end;

procedure TfrPenyewaan.FDTable1CalcFields(DataSet: TDataSet);
begin
  FDTable1jumlah.Value := FDTable1qty.Value * FDTable1harga.Value;
end;

procedure TfrPenyewaan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

end.
