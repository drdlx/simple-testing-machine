unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  rec=record
    QuestionText: ShortString;
    Answer1: ShortString;
    Answer2: ShortString;
    Answer3: ShortString;
    Answer4: ShortString;
    Answer5: ShortString;
    QuestionID: Byte;
    RightAnswer: Byte;
  end;

var
  Form7: TForm7;
  f:file of rec;
  Reco:rec;

implementation
uses unit4;

{$R *.dfm}

procedure TForm7.BitBtn1Click(Sender: TObject);
begin
AssignFile(F,'test.txt');
if fileexists('test.txt') then
  reset(f)
  else
    rewrite(F);
Seek(F,FileSize(F));
Reco.QuestionText := edit1.Text;
Reco.Answer1 := edit2.Text;
Reco.Answer2 := edit3.Text;
Reco.Answer3 := edit4.Text;
Reco.Answer4 := edit5.Text;
Reco.Answer5 := edit6.Text;
Reco.RightAnswer := StrToInt(edit7.Text) - 1;
Reco.QuestionID := {(Form4.ListView1.Items.Count + 1)}StrToInt(Edit8.Text) - 1;
write(F,Reco);

Edit1.Text:='';
Edit2.Text:='';
Edit3.Text:='';
Edit4.Text:='';
Edit5.Text:='';
Edit6.Text:='';
Edit7.Text:='';
Edit8.Text:=inttostr(form4.ListView1.Items.Count + 1);
MessageBox(handle, PChar('Успех!'), PChar('Замечание'),(MB_OK));
CloseFile(f);

Form4.ListView1.Items.Clear;
assignfile(f,'test.txt');
reset(f);
while not eof(f) do
  begin
    read(f,reco);
    with reco do
      begin
        with form4.ListView1.Items.Add do
          begin
            caption:=Reco.QuestionText;
            subitems.Add(Reco.Answer1);
            subitems.Add(Reco.Answer2);
            subitems.Add(Reco.Answer3);
            subitems.Add(Reco.Answer4);
            subitems.Add(Reco.Answer5);
            subitems.Add(IntToStr(reco.RightAnswer));
          end;
      end;
  end;
closefile(f);

end;

procedure TForm7.FormActivate(Sender: TObject);
begin
  edit8.Text:=inttostr(form4.ListView1.Items.Count + 1);
end;

end.
