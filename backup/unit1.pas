unit Unit1;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function IntToBin(const Value: Integer; Digits: Integer): String;
var
  i: Integer;
begin
     Result:= '';
     for i := Digits - 1 downto 0 do
     begin
     if (Value and (1 shl i)) <> 0 then
       Result:= Result + '1'
     else
       Result:= Result + '0';
     end;
end;

function FloatToBinaryStr(const floatValue: Single): String;
          var
            floatBytes: TBytes;
            i: Integer;
          begin
          SetLength(floatBytes, SizeOf(Single));
          FillChar(floatBytes[0], SizeOf(Single), 0);
          Move(floatValue, floatBytes[0], SizeOf(Single));

          Result := '';
          for i := High(floatBytes) downto Low(floatBytes) do
          begin
            Result := Result + IntToBin(floatBytes[i], 8);
            end;
          end;

procedure TForm1.Button1Click(Sender: TObject);
var
  floatValue: Single;
  binaryStr: String;
begin
    begin
      if TryStrToFloat(Edit1.Text, floatValue)
      then
        begin
        binaryStr := FloatToBinaryStr(floatValue);
        Edit2.Text := binaryStr;
        end
        else
        begin
        Edit2.Text := 'Ожидалось вещественное число!';
        end;

        end;

        end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

end.

