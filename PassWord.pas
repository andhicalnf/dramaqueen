unit PASSWORD;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    Image1: TImage;
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute: Boolean;
  end;

//var
  //PasswordDlg: TPasswordDlg;

implementation

{$R *.dfm}

{ TPasswordDlg }

class function TPasswordDlg.Execute: Boolean;
begin
   with TPasswordDlg.Create(nil) do
   try
      if ShowModal = mrOK then
      Result := True
      else Result := False;
      //Result := ShowModal = mrOK lebih efisien
   finally
      Free
   end;
end;

procedure TPasswordDlg.OKBtnClick(Sender: TObject);
begin
  if Password.Text = 'admin' then
    ModalResult := mrOK
  else
  begin
    Application.MessageBox('Password Salah', 'Pesan Kesalahan'); //bisa pakai showmessage tp hrs dikasih uses
    ModalResult := mrCancel;
  end;
end;

end.
 
