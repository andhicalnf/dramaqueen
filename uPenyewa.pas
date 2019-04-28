unit uPenyewa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass,
  frxDBSet;

type
  TfrPenyewa = class(TForm)
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDTable1id_penyewa: TStringField;
    FDTable1nama_penyewa: TStringField;
    FDTable1sex: TStringField;
    FDTable1identitas: TStringField;
    FDTable1alamat: TStringField;
    FDTable1telepon: TStringField;
    FDTable1email: TStringField;
    FDTable1tgmasuk: TDateField;
    FDTable1status: TStringField;
    FDTable1id_gambar: TBlobField;
    FDTable1keterangan: TMemoField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBImage1: TDBImage;
    Label11: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Label10: TLabel;
    Button6: TButton;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    OpenDialog1: TOpenDialog;
    procedure Button4Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPenyewa: TfrPenyewa;

implementation

{$R *.dfm}

procedure TfrPenyewa.Button1Click(Sender: TObject);
begin
  FDTable1.Append;
end;

procedure TfrPenyewa.Button2Click(Sender: TObject);
begin
  FDTable1.Post;
end;

procedure TfrPenyewa.Button3Click(Sender: TObject);
begin
  FDTable1.Delete;
end;

procedure TfrPenyewa.Button4Click(Sender: TObject);
begin
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'penyewa.fr3');
  frxReport1.ShowReport();
end;

procedure TfrPenyewa.Button5Click(Sender: TObject);
begin
    if OpenDialog1.Execute then
    if FileExists(OpenDialog1.FileName) then
            {masukkan data di sini}
       begin
          FDTable1.Edit;
          (FDTable1.FieldByName('image') as
                  TBlobField).LoadFromFile(OpenDialog1.FileName);
       end
    else
      raise Exception.Create('File tidak ada!');
end;

procedure TfrPenyewa.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
  begin
    FDTable1.IndexFieldNames := 'nama_penyewa';
    if FDTable1.Locate('nama_penyewa', Edit1.Text, []) then
      ShowMessage('Pelanggan ditemukan')
    else
      ShowMessage('Pelanggan tidak ditemukan');
    Key := 0;
  end;
end;

end.
