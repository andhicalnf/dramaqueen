unit uPetugas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask, Vcl.StdCtrls, frxClass, frxDBSet,
  Vcl.ExtDlgs;

type
  TfrPetugas = class(TForm)
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    Image1: TImage;
    FDTable1id_petugas: TStringField;
    FDTable1nama_petugas: TStringField;
    FDTable1sex: TStringField;
    FDTable1alamat: TStringField;
    FDTable1telepon: TStringField;
    FDTable1email: TStringField;
    FDTable1tgmasuk: TDateField;
    FDTable1status: TStringField;
    FDTable1foto: TBlobField;
    FDTable1keterangan: TMemoField;
    Label10: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBImage1: TDBImage;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Button4: TButton;
    Button5: TButton;
    Edit2: TEdit;
    Button6: TButton;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    OpenDialog1: TOpenDialog;
    procedure Button5Click(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPetugas: TfrPetugas;

implementation

{$R *.dfm}

procedure TfrPetugas.Button1Click(Sender: TObject);
begin
  FDTable1.Append;
end;

procedure TfrPetugas.Button2Click(Sender: TObject);
begin
 FDTable1.Post;
end;

procedure TfrPetugas.Button3Click(Sender: TObject);
begin
  FDTable1.Delete;
end;

procedure TfrPetugas.Button4Click(Sender: TObject);
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

procedure TfrPetugas.Button5Click(Sender: TObject);
begin
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'petugas.fr3');
  frxReport1.ShowReport();
end;

procedure TfrPetugas.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
  begin
    FDTable1.IndexFieldNames := 'nama_petugas';
    if FDTable1.Locate('nama_petugas', Edit2.Text, []) then
      ShowMessage('Petugas ditemukan')
    else
      ShowMessage('Petugas tidak ditemukan');
    Key := 0;
  end;
end;

end.
