unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm6 = class(TForm)
    Label2: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form6: TForm6;
  s,s1:string;
  f:text;

implementation

uses Unit3, Unit5;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
  s:=form3.edit1.text + '_' + form3.edit2.text;
  s1:=form3.edit1.text + ' ' + form3.edit2.text + ' ' + form3.edit3.text + ' ' + form3.edit4.text + ' ' + 'Правильных ответов: ' + inttostr(unit5.result) + ' ' + 'Процентное соотношение: ' + inttostr(unit5.percentage) + '%';
  if (Edit1.Text = 'azaza' ) then
    begin

      if directoryexists(form3.edit5.text) then
        begin
          assignfile(f,form3.edit5.text + '\' + s + '.txt');
          rewrite(f);
          append(f);
          writeln(f,s1);
          flush(f);
          closefile(f);
        end
      else
        begin
          createdir(form3.edit5.text);
          assignfile(f,form3.edit5.text + '\' + s + '.txt');
          rewrite(f);
          append(f);
          writeln(f,s1);
          flush(f);
          closefile(f);
        end;

      Application.Terminate;
    end
    else
      ShowMessage('loh ne smog ツ');
      Application.Terminate;
end;

procedure TForm6.FormActivate(Sender: TObject);
begin
{Приготовим данные для показа}
  StaticText2.Caption := 'Ваш результат - ' + IntToStr(Unit5.Result) + ' из ' + IntToStr(Unit5.Nx) + ' ответов. Это ' + IntToStr(Unit5.Percentage) + '%.';
{Сделаем всё активным}
  Edit1.Enabled := True;
  Button1.Enabled := True;
{Теперь всё покажем}
  StaticText1.Visible := True;
  StaticText2.Visible := True;
  StaticText3.Visible := True;
  Label2.Visible := True;
  Edit1.Visible := True;
  Button1.Visible := True;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ShowMessage('loh ne smog ツ');
  Action := CaNone;
end;

end.
