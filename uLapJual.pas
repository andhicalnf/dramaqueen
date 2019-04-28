unit uLapJual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids;

type
  TfrLapJual = class(TForm)
    ComboBox1: TComboBox;
    Button1: TButton;
    Image1: TImage;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    FDQuery2: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    ComboBox3: TComboBox;
    ComboBox2: TComboBox;
    DateTimePicker1: TDateTimePicker;
    DBGrid1: TDBGrid;
    FDTable1: TFDTable;
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
    FDTable1total: TAggregateField;
    frxDBDataset3: TfrxDBDataset;
    FDQuery1no_sewa: TIntegerField;
    FDQuery1id_dvd: TStringField;
    FDQuery1judul: TStringField;
    FDQuery1harga: TIntegerField;
    FDQuery1qty: TIntegerField;
    FDQuery1tgl_sewa: TDateField;
    FDQuery1stok: TIntegerField;
    FDQuery1jumlah: TLargeintField;
    FDQuery1total: TAggregateField;
    procedure ComboBox1Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
  private
    { Private declarations }
    Procedure showSatu();
    Procedure showDua();
    Procedure showTiga();
    procedure printH();
    procedure printB();
    procedure printT();
  public
    { Public declarations }
  end;

var
  frLapJual: TfrLapJual;

implementation

{$R *.dfm}

procedure TfrLapJual.Button1Click(Sender: TObject);
begin
if combobox1.ItemIndex = 0 then
  printH()
else if combobox1.ItemIndex =1 then
  printB()
else if combobox1.ItemIndex =2 then
  printT();
end;

procedure TfrLapJual.ComboBox1Change(Sender: TObject);
begin
if combobox1.ItemIndex = 0 then
  showSatu()
else if combobox1.ItemIndex =1 then
  showDua()
else if combobox1.ItemIndex =2 then
  showTiga();
end;

procedure TfrLapJual.ComboBox2Change(Sender: TObject);
var bulan : String;
begin
bulan := IntToStr(Combobox2.ItemIndex);
FDQuery1.SQL.Text := 'Select * FROM lapjual WHERE tgl_sewa Like' + QuotedStr('%-'+bulan+'-%');
FDQuery1.Active := true ;
end;

procedure TfrLapJual.ComboBox3Change(Sender: TObject);
var tahun : String;
begin
tahun := Combobox3.Text;
FDQuery1.SQL.Text := 'Select * FROM lapjual WHERE tgl_sewa Like' + QuotedStr('%'+tahun+'%');
FDQuery1.Active := true ;
end;

procedure TfrLapJual.DateTimePicker1Change(Sender: TObject);
begin
FDQuery1.SQL.Text := 'Select * FROM lapjual WHERE tgl_sewa Like' + QuotedStr(FormatDateTime('yyyy-mm-dd',Datetimepicker1.date));
FDQuery1.Active := true ;
end;

procedure TfrLapJual.printB;
begin
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'laporanB.fr3');
  frxReport1.ShowReport();
end;

procedure TfrLapJual.printH;
begin
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'laporanH.fr3');
  frxReport1.ShowReport();
end;

procedure TfrLapJual.printT;
begin
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'laporanT.fr3');
  frxReport1.ShowReport();
end;

procedure TfrLapJual.showDua;
begin
  DateTimePicker1.Visible := False;
  ComboBox2.Visible := True;
  ComboBox3.Visible := False;
end;

procedure TfrLapJual.showSatu;
begin
  DateTimePicker1.Visible := True;
  ComboBox2.Visible := False;
  ComboBox3.Visible := False;
end;

procedure TfrLapJual.showTiga;
begin
  DateTimePicker1.Visible := False;
  ComboBox2.Visible := False;
  ComboBox3.Visible := True;
end;

end.
