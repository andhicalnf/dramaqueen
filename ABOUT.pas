unit About;

interface

uses WinApi.Windows, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowMySelf;
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

{ TAboutBox }

class procedure TAboutBox.ShowMySelf; //constructor destructor sendiri
begin
  AboutBox := TAboutBox.Create(nil);
  try
     AboutBox.ShowModal;  //mencegah sistem error
  finally
     AboutBox.Free;
  end;
end;

end.
 
