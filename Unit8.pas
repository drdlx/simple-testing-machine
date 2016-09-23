unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  i:integer;

implementation
uses unit4;

{$R *.dfm}

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
form4.row:= form4.ListView1.ItemIndex;
with form4.ListView1 do
  begin
    items[itemindex].Caption:=edit1.Text;
    items[itemindex].SubItems[0]:=edit2.Text;
    items[itemindex].SubItems[1]:=edit3.Text;
    items[itemindex].SubItems[2]:=edit4.Text;
    items[itemindex].SubItems[3]:=edit5.Text;
    items[itemindex].SubItems[4]:=edit6.Text;
    items[itemindex].SubItems[5]:=edit7.Text;
    MessageBox(handle, PChar('Успех!'), PChar('Замечание'),(MB_OK));
    assignfile(f,'test.txt');
    rewrite(f);
    for i:=0 to form4.listview1.Items.Count - 1 do
      begin
        reco.QuestionText:=form4.listview1.Items[i].Caption;
        reco.Answer1:=form4.listview1.Items[i].SubItems[0];
        reco.Answer2:=form4.listview1.Items[i].SubItems[1];
        reco.Answer3:=form4.listview1.Items[i].SubItems[2];
        reco.Answer4:=form4.listview1.Items[i].SubItems[3];
        reco.Answer5:=form4.listview1.Items[i].SubItems[4];
        reco.RightAnswer:=strtoint(form4.listview1.Items[i].SubItems[5]);
        reco.QuestionID:= form4.listview1.Items.Count + 1;
        write(f,reco);
      end;
    closefile(f);
  end;
form4.ListView1.Items.Clear;
assignfile(f,'test.txt');
reset(f);
while not eof(f) do
  begin
    read(f,reco);
    with reco do
      begin
        with form4.ListView1.Items.Add do
          begin
            caption:=reco.QuestionText;
            subitems.Add(reco.Answer1);
            subitems.Add(reco.Answer2);
            subitems.Add(reco.Answer3);
            subitems.Add(reco.Answer4);
            subitems.Add(reco.Answer5);
            subitems.Add(inttostr(reco.RightAnswer));
          end;
      end;
  end;
closefile(f);
end;

procedure TForm8.BitBtn2Click(Sender: TObject);
begin
form4.row:=form4.ListView1.ItemIndex;
with form4.ListView1 do
  begin
    selected.Delete;
    edit1.Text:='';
    edit2.Text:='';
    edit3.Text:='';
    edit4.Text:='';
    edit5.Text:='';
    edit6.Text:='';
    edit7.Text:='';
    MessageBox(handle, PChar('Удалено!'), PChar('Замечание'),(MB_OK));
  end;
assignfile(f,'test.txt');
rewrite(f);
for i:=0 to form4.listview1.Items.Count - 1 do
  begin
    reco.QuestionText:=form4.listview1.Items[i].Caption;
    reco.Answer1:=form4.listview1.Items[i].SubItems[0];
    reco.Answer2:=form4.listview1.Items[i].SubItems[1];
    reco.Answer3:=form4.listview1.Items[i].SubItems[2];
    reco.Answer4:=form4.listview1.Items[i].SubItems[3];
    reco.Answer5:=form4.listview1.Items[i].SubItems[4];
    reco.RightAnswer:=strtoint(form4.listview1.Items[i].SubItems[5]);
    reco.QuestionID:= form4.listview1.Items.Count ;
    write(f,reco);
  end;
closefile(f);

form4.ListView1.Items.Clear;
assignfile(f,'test.txt');
reset(f);
while not eof(f) do
  begin
    read(f,reco);
    with reco do
      begin
        with form4.ListView1.Items.Add do
          begin
            caption:=reco.QuestionText;
            subitems.Add(reco.Answer1);
            subitems.Add(reco.Answer2);
            subitems.Add(reco.Answer3);
            subitems.Add(reco.Answer4);
            subitems.Add(reco.Answer5);
            subitems.Add(inttostr(reco.RightAnswer));
          end;
      end;
  end;
closefile(f);

end;

end.
