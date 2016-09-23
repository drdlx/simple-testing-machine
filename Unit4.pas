unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Vcl.ComCtrls, unit7, unit8;

type
  Rec = record
    QuestionText: String[255];
    Answer1: ShortString;
    Answer2: ShortString;
    Answer3: ShortString;
    Answer4: ShortString;
    Answer5: ShortString;
    QuestionID: Byte;
    RightAnswer: Byte;
  end;
  TForm4 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    ListView1: TListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    Row: Integer;
  end;

var
  Form4: TForm4;
  F: file of Rec;
  Reco: Rec;
  I: Byte;
implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  AssignFile(F,'test.txt');
  rewrite(F);
  for I := 0 to (ListView1.Items.Count-1) do
    begin
      Reco.QuestionText:=listview1.Items[I].Caption;
      Reco.Answer1 := listview1.Items[I].SubItems[0];
      Reco.Answer2 := listview1.Items[I].SubItems[1];
      Reco.Answer3 := listview1.Items[I].SubItems[2];
      Reco.Answer4 := listview1.Items[I].SubItems[3];
      Reco.Answer5 := listview1.Items[I].SubItems[4];
      Reco.RightAnswer := StrToInt(listview1.Items[I].SubItems[5]);
      Reco.QuestionID := Listview1.Items.Count;
      Write(F,Reco);
    end;
  CloseFile(F);
  Form4.ListView1.Items.Clear;

assignfile(f,'test.txt');
reset(f);
while not eof(f) do
  begin
    read(f,reco);
    with reco do
      begin
        with ListView1.Items.Add do
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

procedure TForm4.Button3Click(Sender: TObject);
begin
  Form7.Show;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
  if (FileExists('test.txt')) then
  begin
    Form4.ListView1.Items.Clear;
    AssignFile(f,'test.txt');
    reset(F);
    while not eof(F) do
      begin
        read(F,Reco);
        with Reco do
          with Form4.ListView1.Items.Add do
            begin
              Caption := Reco.QuestionText;
              SubItems.Add(Reco.Answer1);
              SubItems.Add(Reco.Answer2);
              SubItems.Add(Reco.Answer3);
              SubItems.Add(Reco.Answer4);
              SubItems.Add(Reco.Answer5);
              SubItems.Add(IntToStr(Reco.RightAnswer));
            end;
      end;
    CloseFile(F);
  end;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm4.ListView1DblClick(Sender: TObject);
begin
  Row:=listview1.ItemIndex;
  form8.Edit1.Text:=listview1.Items[listview1.ItemIndex].Caption;
  form8.Edit2.Text:=listview1.Items[listview1.ItemIndex].SubItems[0];
  form8.Edit3.Text:=listview1.Items[listview1.ItemIndex].SubItems[1];
  form8.Edit4.Text:=listview1.Items[listview1.ItemIndex].SubItems[2];
  form8.Edit5.Text:=listview1.Items[listview1.ItemIndex].SubItems[3];
  form8.Edit6.Text:=listview1.Items[listview1.ItemIndex].SubItems[4];
  form8.Edit7.Text:=listview1.Items[listview1.ItemIndex].SubItems[5];
  form8.Show;
end;

end.
