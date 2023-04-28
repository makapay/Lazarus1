unit unitLab1Pavlova1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.Button1Click(Sender: TObject);
var
dist :integer; // дистанция, метров
 t: real; // время
 v: real;
begin
  // получить исходные данные из полей ввода
dist := StrToInt(Edit1.Text);
t := StrToFloat(Edit2.Text);
// вычисление
v := dist/t;
// вывод результата
Label4.Caption := 'Дистанция: '+ Edit1.Text + ' м' + #13 + 'Время: ' +
FloatToStr(t) + ' сек ' + #13 + 'Скорость: ' + FloatToStrF(v,ffFixed,4,2) + ' м/с';

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.Close;
end;
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 // Key - символ, соответствующий нажатой клавише.
 // Если символ недопустимый, то процедура заменяет его
 // на символ с кодом 0. В результате этого символ в поле
 // редактирования не появляется и у пользователя создается
 // впечатление, что программа не реагирует на нажатие некоторых
// клавиш.
case Key of
 '0'..'9': ;// цифра
 #8 : ; // <Backspace>
 #13 : Edit2.SetFocus ; // <Enter>
 // остальные символы - запрещены
else Key :=Chr(0); // символ не отображать
end;
end;

// нажатие клавиши в поле Время
procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
case Key of
'0'..'9': ;// цифра
',','.' :// точка или запятая
begin
if Key = '.' then Key := ','; // подменим точку запятой
// проверим, есть ли в поле Edit2 запятая
if Pos(',',Edit2.Text) <> 0 // запятая уже есть
then Key:=Char(0); // вторую запятую не отображать
end;
 #8 :; // <Backspace>
// остальные символы - запрещены
else Key :=Chr(0); // символ не отображать
end;
end;

end.
