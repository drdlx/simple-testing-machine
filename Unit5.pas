unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Unit6;

type
  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    Label1: TLabel;
    StaticText1: TStaticText;
    Button3: TButton;
    Button4: TButton;
    PageControl1: TPageControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure TabsCreate1(var n: Byte);
    procedure AnswerSaving;
  end;
  Rec = record
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
  Form5: TForm5;
  Time: Integer;
  N, Nx: Byte;
  CheckingArray, AnswerArray: array of Byte;
  Result, Percentage: Byte;
  QuestionPack: set of Byte;
  F: File of Rec;
  Radio: TRadioGroup;
  Tab: TTabSheet;
  Showing: String;

implementation

{$R *.dfm}

procedure TForm5.TabsCreate1(var N: Byte);
var I,I1,I2: Byte;
  Na: String;
  Tab: TTabSheet;
  Txt: TLabel;
  Radio: TRadioGroup;
  Question, Reader: Rec;
  AnswerNumber: Byte;
  AnswerNumbers: set of Byte;
  QuestionNumber: Byte;
  Check: Byte;
  CheckQ: Byte;
  Flg: Boolean;
  Lal: TComponent;
begin
  Check := 0;
  N := 0;
{Посчитаем количество записей}
  AssignFile(F,'test.txt');
  reset(F);
  while not eof(F) do
    begin
      read(F,Reader);
      inc(N);
    end;
  CloseFile(F);
  dec(N);
  Nx := 30;
{Откроем файл}
AssignFile(F,'test.txt');
reset(F);
{Почистим тут всё}
  QuestionPack := [];
  AnswerNumbers := [];
  AnswerNumber := 0;
  I1 := 0;
{Установим длину массивов}
  SetLength(CheckingArray, Nx);
  SetLength(AnswerArray, Nx);
{Сделаем основу для заголовков}
  Na := 'Вопрос ';
  for I := 0 to Nx - 1 do
    begin
  {Замутим генератор на случайное расположение вопросов}
      QuestionNumber := random(N + 1);
      if (QuestionNumber in QuestionPack) then
        while (QuestionNumber in QuestionPack) do
          QuestionNumber := random(N + 1);
      QuestionPack := QuestionPack + [QuestionNumber];            //Добавим номер вопроса в множество, чтоб его больше не дергать
      seek(F, QuestionNumber);                                    //Зацепим вопрос по его номеру из файла
      read(F, Question);
      Tab := TTabSheet.Create(Form5);
  {Пропишем заголовки}
      with Tab do
        begin
          Parent := PageControl1;
          Visible := True;
          Caption :=  Na + IntToStr(I+1);
          PageControl := PageControl1;
        end;
  {Добавим вопросы}
      Txt := TLabel.Create(Form5);
  {Опишем свойства}
      with Txt do
        begin
          Parent := Tab;
          AutoSize := False;
          WordWrap := True;
          Left := 40;
          Top := 50;
          Width := 600;
          Height := 300;
      {Запилим вопрос}
          Caption := Question.QuestionText;
        end;
  {Добавим радио}
      Radio := TRadioGroup.Create(Form5);
  {Опишем свойства}
      with Radio do
        begin
          Parent := Tab;
          Left := 40;
          Top := 140;
          Width := 650;
          Height := 100;
          Caption := 'Вопрос ' + IntToStr(I+1);
          Name := 'Radio' + IntToStr(I+1);
        end;
      {Сделаем рандомное расположение вариантов ответов}
          for Check := 0 to 4 do
            begin
              AnswerNumber := random(5);                          //Вот это забавный номер, он если 4 ставить, почему-то, на 4 не может выйти. К чему бы это?
              Randomize;
          {Вытаскиваем другое число из множества, если вдруг попалось то, которое уже было}
              if (AnswerNumber in AnswerNumbers) then
                while (AnswerNumber in AnswerNumbers) do
                  AnswerNumber := random(5);
                AnswerNumbers := AnswerNumbers + [AnswerNumber];  //Добавим номер ответа во множество, чтоб не было повторов
                case AnswerNumber of                              //Вытащим вопросмы по рандому
                  0: Radio.Items.Add(Question.Answer1);
                  1: Radio.Items.Add(Question.Answer2);
                  2: Radio.Items.Add(Question.Answer3);
                  3: Radio.Items.Add(Question.Answer4);
                  4: Radio.Items.Add(Question.Answer5);
                  else ShowMessage('ААА, АШИПКА, ВСЁ СЛОМАЛОСЬ');
                end;
            {Добавим правильный ответ в массив с ответами}
                if (AnswerNumber = Question.RightAnswer - 1) then
                  begin
                    CheckingArray[I] := Check;
                    //ShowMessage(IntToStr(CheckingArray[I]));
                  end;

            end;
          Radio.ItemIndex := 0;                                   //Заделаем активный элемент
      {Почистим множество ответов для генерации следующего вопроса}
          AnswerNumbers := [];
          dec (I1,I1);
    end;
  CloseFile(F);
  PageControl1.ActivePage := PageControl1.Pages[1];
  PageControl1.ActivePage := PageControl1.Pages[0];
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
{Откроем доступ к тесту}
  PageControl1.Enabled := true;
  Button2.Enabled := true;
  Button1.Enabled := false;
{Включим таймер}
  time := 900;
  Timer1.Enabled := true;
  N := 1;                                                       //Отсюда отправим количество вопросов
  TabsCreate1(N);                                               //Создадим нужное количество вкладок для вопросов
end;

procedure TForm5.Button2Click(Sender: TObject);
  var counter,counter1: Byte;
//  var res1,res2: String; - всё для диагностики
  var I: Byte;
begin
  Result := 0;
  AnswerSaving;
  {
  //Диагностическая процедура, пущая закомментенная будет, на всякий
  for counter := 0 to Nx-1 do
    begin
      res1 := res1 + IntToStr(CheckingArray[counter]) + ' ';
      res2 := res2 + IntToStr(AnswerArray[counter]) + ' ';
    end;
  //
  }
{Выведем ответ}
  for I := 0 to Nx do
    if (CheckingArray[I] = AnswerArray[I]) then
      inc(Result);                                                //Получим количество правильных ответов
    if (Result <> 0) then
      if Result = Nx then
        Percentage := 100
        else
          Percentage := round((100 / (Nx + 1)) * Result)               //А это - в процентном соотношении
      else
        Percentage := 0;                                          //На случай, если тестируемый - лалка
{Завершение тестирования}
  //Нижеследующая херня - для диагностики, в принципе, пусть в таком виде и торчит
  //ShowMessage(res1);
  //ShowMessage(res2);
  //ShowMessage(IntToStr(Result));
  //ShowMessage(IntToStr(Percentage));
  Form6.Show;
  Form5.Hide;
end;

procedure TForm5.AnswerSaving;
  var C: TComponent;
    Check: Byte;
    S: String;
  begin
    for Check := 1 to Nx do
      begin
        S := 'Radio' + IntToStr(Check);                         //Возьмем имя радиогруппы
        C := FindComponent(S);                                  //И засунем её в переменную
        if (C <> nil) then
            AnswerArray[Check - 1] := (C as TRadioGroup).ItemIndex  //Откуда запишем ответ пользователя
          else
            ShowMessage('Что-то пошло не так...');
      end;
  end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex > 0) then      //Сделаем проверку, чтоб не уходил, куда не надо
    PageControl1.ActivePageIndex := PageControl1.ActivePageIndex - 1;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex < (PageControl1.PageCount - 1)) then
    PageControl1.ActivePageIndex := PageControl1.ActivePageIndex + 1;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ShowMessage('loh ne smog ツ');
  Action := CaNone;
end;

function ShowTime(Time: integer): string;
var
  hour, min, sec: integer;
  t1: TDateTime;
begin
  {Функция вывода таймера на экран}
  hour := time div 3600;
  min := time div 60;
  if (min > 60) then
    min := min-(hour*60);
  sec := time mod 60;
  Result:= FormatDateTime('h:mm:ss', EncodeTime(hour, min, sec, 0));
end;

procedure TForm5.Timer1Timer(Sender: TObject);
var min,sec:integer;
begin
  if (time>0) then      {Работа таймера}
    begin
      dec(time);
      StaticText1.Caption := ShowTime(Time);
    end
    else
      begin             {Остановка таймера}
        Timer1.Enabled := false;
        PageControl1.Enabled := false;
        Button1.Enabled := false;
      end;
end;

end.
