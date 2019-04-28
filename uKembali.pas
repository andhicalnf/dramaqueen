unit uKembali;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.Client, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.DataSet;

type
  TfrKembali = class(TForm)
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    edTanggalSewa: TDateTimePicker;
    Image1: TImage;
    FDQuery1: TFDQuery;
    edNoSewa: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtotalDenda: TDBEdit;
    edKembalian: TEdit;
    edBayar: TEdit;
    edNamaSewa: TEdit;
    FDQuery2: TFDQuery;
    Label8: TLabel;
    edTanggalKembali: TDateTimePicker;
    edKeterlambatan: TEdit;
    btnSubmit: TButton;
    edDendaKeterlambatan: TEdit;
    DBGrid1: TDBGrid;
    FDTable1: TFDTable;
    FDTable1no_sewa: TIntegerField;
    FDTable1id_penyewa: TStringField;
    FDTable1nama_penyewa: TStringField;
    FDTable1id_dvd: TStringField;
    FDTable1judul: TStringField;
    FDTable1qty: TIntegerField;
    FDTable1tgl_kembali: TDateField;
    FDTable1tgl_sewa: TDateField;
    FDTable1keterlambatan: TIntegerField;
    FDTable1denda_keterlambatan: TIntegerField;
    FDTable1kembali: TIntegerField;
    FDTable1bayar: TIntegerField;
    FDTable1totalDenda: TAggregateField;
    Label3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edIdDvd: TEdit;
    Label12: TLabel;
    procedure edNoSewaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTanggalSewaChange(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure edBayarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frKembali: TfrKembali;

implementation

{$R *.dfm}

procedure TfrKembali.btnSubmitClick(Sender: TObject);
begin
    if edNoSewa.Text = FDQuery1.FieldByName('No_Sewa').AsString then

    FDTable1.Append;
    FDTable1.FieldByName('no_sewa').AsString := FDQuery1.FieldByName('No_Sewa').AsString;
    FDTable1.FieldByName('nama_penyewa').AsString := FDQuery1.FieldByName('nama_penyewa').AsString;
    FDTable1.FieldByName('judul').AsString := FDQuery1.FieldByName('judul').AsString;
    FDTable1.FieldByName('tgl_sewa').AsDateTime := VartoDateTime(edTanggalSewa.Date);
    FDTable1.FieldByName('tgl_kembali').AsDateTime := VartoDateTime(edTanggalKembali.Date);
    FDTable1.FieldByName('id_dvd').AsString := edIdDvd.Text;
    FDTable1.FieldByName('id_penyewa').AsString := FDQuery1.FieldByName('id_penyewa').AsString;
    FDTable1.FieldByName('denda_keterlambatan').AsString := edDendaKeterlambatan.Text;
    FDTable1.FieldByName('keterlambatan').AsString := edKeterlambatan.Text;
    FDTable1.FieldByName('qty').AsInteger := FDQuery1.FieldByName('qty').AsInteger;
    FDTable1.Post;
end;


 {
procedure TfrKembali.ComboBox2Change(Sender: TObject);
var bulan : String;
begin
bulan := IntToStr(Combobox2.ItemIndex);
FDQuery1.SQL.Text := 'Select * FROM sewa WHERE no_sewa Like' + QuotedStr('%-'+bulan+'-%');
FDQuery1.Active := true ;
end;                 }

procedure TfrKembali.edBayarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var kembali : Integer;
begin   if Key=13 then   begin     kembali := StrToInt(edBayar.Text) - StrToInt(edtotalDenda.Text);     edKembalian.Text := IntToStr(kembali);   end;end;

procedure TfrKembali.edNoSewaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
  begin
   FDQuery1.IndexFieldNames := 'no_sewa';
    if FDQuery1.Locate('no_sewa', edNoSewa.Text, []) then
       begin
          edNamaSewa.Text := FDQuery1.FieldByName('nama_penyewa').AsString;
          edIdDvd.Text := FDQuery1.FieldByName('id_dvd').AsString;
          edTanggalSewa.Date := FDQuery1.FieldByName('tgl_sewa').AsDateTime;
          edTanggalKembali.SetFocus;
       end
    else
       ShowMessage('No Sewa tidak ditemukan');
    Key := 0 ;
  end;
end;

procedure TfrKembali.edTanggalSewaChange(Sender: TObject);
var
denda: integer;
begin
edKeterlambatan.Text:=FloatToStr((StrtoDate(DateToStr(edTanggalKembali.Date))-StrtoDate(DateToStr(edTanggalSewa.Date)))-7);
denda:=5000;
edDendaKeterlambatan.Text:=IntToStr(StrToInt(edKeterlambatan.Text)*denda);
end;

procedure TfrKembali.FormCreate(Sender: TObject);
begin
  edTanggalKembali.Date := Now;
end;
     {
procedure TfrKembali.showDua;
begin
  edTanggalKembali.Visible := False;
  ComboBox2.Visible := True;
  ComboBox3.Visible := False;
end;

procedure TfrKembali.showSatu;
begin
  edTanggalKembali.Visible := True;
  ComboBox2.Visible := False;
  ComboBox3.Visible := False;
end;

procedure TfrKembali.showTiga;
begin
  edTanggalKembali.Visible := False;
  ComboBox2.Visible := False;
  ComboBox3.Visible := True;
end;              }

end.
