unit uKaset;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Mask,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrKaset = class(TForm)
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBImage1: TDBImage;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Edit2: TEdit;
    Button5: TButton;
    FDTable1: TFDTable;
    FDTable1id_dvd: TStringField;
    FDTable1judul: TStringField;
    FDTable1stok: TIntegerField;
    FDTable1tahun_produksi: TStringField;
    FDTable1hargasewa: TIntegerField;
    FDTable1image: TBlobField;
    FDTable1kategori: TStringField;
    FDTable1status: TStringField;
    DataSource1: TDataSource;
    OpenDialog1: TOpenDialog;
    Image1: TImage;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frKaset: TfrKaset;

implementation

{$R *.dfm}

procedure TfrKaset.Button1Click(Sender: TObject);
begin
  FDTable1.Append;
end;

procedure TfrKaset.Button2Click(Sender: TObject);
begin
  FDTable1.Post;
end;

procedure TfrKaset.Button3Click(Sender: TObject);
begin
  FDTable1.Delete;
end;

procedure TfrKaset.Button5Click(Sender: TObject);
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

procedure TfrKaset.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
  begin
    FDTable1.IndexFieldNames := 'judul';
    if FDTable1.Locate('judul', Edit1.Text, []) then
      ShowMessage('Drama ditemukan')
    else
      ShowMessage('Drama tidak ditemukan');
    Key := 0;
  end;
end;

end.
