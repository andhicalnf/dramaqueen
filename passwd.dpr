program passwd;

uses
  Vcl.Forms,
  main in 'main.pas' {formMain},
  ABOUT in 'ABOUT.pas' {AboutBox},
  PassWord in 'PassWord.pas' {PasswordDlg},
  uKaset in 'uKaset.pas' {frKaset},
  uPenyewa in 'uPenyewa.pas' {frPenyewa},
  uPetugas in 'uPetugas.pas' {frPetugas},
  uSewa in 'uSewa.pas' {frPenyewaan},
  uKembali in 'uKembali.pas' {frKembali},
  uLapJual in 'uLapJual.pas' {frLapJual};

{$R *.res}

begin
  if not TPasswordDlg.Execute then
      Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.HelpFile := 'C:\Users\user only\Videos\favicon.ico';
  Application.Title := 'Drama Queen';
  Application.CreateForm(TformMain, formMain);
  Application.Run;
end.
