unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Vcl.ComCtrls,
  Vcl.StdCtrls, Math, Vcl.Clipbrd;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Chart2: TChart;
    Chart3: TChart;
    Chart4: TChart;
    Chart5: TChart;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    TabSheet1: TTabSheet;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Chart1: TChart;
    Series1: TLineSeries;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    ListBox1: TListBox;
    Label2: TLabel;
    ListBox2: TListBox;
    Label3: TLabel;
    ListBox3: TListBox;
    Label4: TLabel;
    ListBox6: TListBox;
    Label7: TLabel;
    ListBox7: TListBox;
    Button7: TButton;
    procedure step1;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function omega(input:real):Real;
    function arctan2(y:Real;x:Real): Real;
    function Xdynamical (t0:Real; x0:Real; y0:Real): Real;
    function Ydynamical (t0:Real; x0:Real; y0:Real): Real;
    function Zdynamical (t0:Real; x0:Real; y0:Real; z0: Real) : Real;
    function modul(input1 : real; input2: Real) : Real;
    procedure normal1;
    procedure normal2;
    procedure normal3;
    procedure normalaVR;
    procedure normalaVL;
    procedure normalaVF;
    procedure normalV1;
    procedure normalV2;
    procedure normalV3;
    procedure normalV4;
    procedure normalV5;
    procedure normalV6;
    procedure anterior1;
    procedure anterior2;
    procedure anterior3;
    procedure anterioraVR;
    procedure anterioraVL;
    procedure anterioraVF;
    procedure anteriorV1;
    procedure anteriorV2;
    procedure anteriorV3;
    procedure anteriorV4;
    procedure anteriorV5;
    procedure anteriorV6;
    procedure inferior1;
    procedure inferior2;
    procedure inferior3;
    procedure inferioraVR;
    procedure inferioraVL;
    procedure inferioraVF;
    procedure inferiorV1;
    procedure inferiorV2;
    procedure inferiorV3;
    procedure inferiorV4;
    procedure inferiorV5;
    procedure inferiorV6;
    procedure lateral1;
    procedure lateral2;
    procedure lateral3;
    procedure lateralaVR;
    procedure lateralaVL;
    procedure lateralaVF;
    procedure lateralV1;
    procedure lateralV2;
    procedure lateralV3;
    procedure lateralV4;
    procedure lateralV5;
    procedure lateralV6;
    procedure septal1;
    procedure septal2;
    procedure septal3;
    procedure septalaVR;
    procedure septalaVL;
    procedure septalaVF;
    procedure septalV1;
    procedure septalV2;
    procedure septalV3;
    procedure septalV4;
    procedure septalV5;
    procedure septalV6;
    procedure posterior1;
    procedure posterior2;
    procedure posterior3;
    procedure posterioraVR;
    procedure posterioraVL;
    procedure posterioraVF;
    procedure posteriorV1;
    procedure posteriorV2;
    procedure posteriorV3;
    procedure posteriorV4;
    procedure posteriorV5;
    procedure posteriorV6;
    procedure rungekutta;
    procedure typeSignalNormal;
    procedure typeSignalAnterior;
    procedure typeSignalInferior;
    procedure typeSignalLateral;
    procedure typeSignalSeptal;
    procedure typeSignalPosterior;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  f,f1,f2,c1,c2,rasio,fsint,tau1,tau2,fm,hmean, scale,ModFactor: Real;
  pt,qt,rt,st,tt,pa,qa,sa,Ra,ta,pb,qb,sb,tb,rb: Real;
  jumlahData,fsecg, ParAmount,iterRK: Integer;
  ai,ti,bi: array[1..6] of Real;
  s,sm, re, im, idft_re, idft_im, rr : array [0..100000] of Real;
  x,y,z,fin_ECG  : array[0..10000] of Extended;
  after : array [0..256] of real;

implementation

{$R *.dfm}

// Pembentukan spektrum mayer waves dan RSA
procedure TForm1.step1;
var i,n,k: Integer;
begin
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;
  Series5.Clear;
  Series6.Clear;
  Series7.Clear;

  CheckBox1.Checked:=True;
  CheckBox2.Checked:=True;
  CheckBox3.Checked:=True;
  CheckBox4.Checked:=True;

  f1:=StrToFloat(Edit10.Text);    // frekuensi LF
  f2:=StrToFloat(Edit11.Text);    // frekuensi HF
  c1:=StrToFloat(Edit12.Text);    // standard deviasi LF
  c2:=StrToFloat(Edit13.Text);    // standard deviasi HF
  tau1:=0.06;                     // untuk membentuk LF/HF rasio
  tau2:=0.0848;
  rasio:=Sqr(tau1/tau2);          // rasio LF/HF
  Edit14.Text:=FloatToStrF(rasio,ffGeneral,2,1);
  jumlahData:= StrToInt(Edit16.Text);
  hmean:=StrToFloat(Edit15.Text);      // heart rate mean
  scale:=StrToFloat(Edit17.Text);      // scaling
  fsecg := StrToInt(Edit18.Text);      // frek sampling

  for n:=0 to jumlahData-1 do
   begin
     f:=n/(jumlahData-1);
     s[n] := (((Sqr(tau1))/Sqrt(2*pi*sqr(c1)))*exp(-(Sqr(f-f1))/(2*sqr(c1)))) +
             (((Sqr(tau2))/Sqrt(2*pi*sqr(c2)))*exp(-(Sqr(f-f2))/(2*sqr(c2))));             // menggunakan gaussian distribution
     Series2.AddXY(f,s[n]);
     ListBox1.Items.Add(FloatToStr(s[n]));
   end;


   //mirroring
   for n:=0 to Round((jumlahData-1)/2) do
   begin
     f:=n/(jumlahData-1);
     sm[n] := Sqrt(s[n]);   // amplitudonya dibikin akar dari power spektrum
     Series3.AddXY(f,sm[n]);
     ListBox2.Items.Add(FloatToStr(sm[n]));
   end;

   for n:= Round((jumlahData-1)/2) to jumlahData-1 do
   begin
     f:=n/(jumlahData-1);
     fm:=1-f;
     sm[n] := Sqrt((((Sqr(tau1))/Sqrt(2*pi*sqr(c1)))*exp(-(Sqr(fm-f1))/(2*sqr(c1)))) +
              (((Sqr(tau2))/Sqrt(2*pi*sqr(c2)))*exp(-(Sqr(fm-f2))/(2*sqr(c2)))));
     Series3.AddXY(f,sm[n]);
     ListBox3.Items.Add(FloatToStr(sm[n]));
   end;

   //random phase
   for n := 0 to jumlahData-1 do
   begin
    re[n] := Sm[n]*cos(2*pi*random);
    im[n] := Sm[n]*sin(2*pi*random);

    Series4.AddXY(n/(jumlahData-1),re[n]);
    Series5.AddXY(n/(jumlahData-1),im[n]);

    end;

   //idft
  for n := 0 to jumlahData-1 do
  begin
    idft_re[n] := 0;
    idft_im[n] := 0;
    for k := 0 to jumlahData-1 do
    begin
      idft_re[n] := idft_re[n] + (Re[k]*cos(2*pi*n*k/jumlahData)) + (im[k]*sin(2*pi*n*k/jumlahData));
      idft_im[n] := idft_im[n] + (Re[k]*cos(2*pi*n*k/jumlahData)) + (im[k]*sin(2*pi*n*k/jumlahData));
      rr[n] := (idft_re[n]+idft_im[n])/jumlahData;

    end;

    Series6.AddXY(n,rr[n])
  end;

  //scaling
   for n := 0 to jumlahData-1 do

  begin
    after[n] := scale*rr[n]+60/hmean;;
    Series7.AddXY(n,after[n]);
    ListBox6.Items.Add(FloatToStr(after[n]))
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);   // Sinyal Normal
begin
  step1;
  TypeSignalNormal;
end;

procedure TForm1.Button2Click(Sender: TObject);   // Sinyal Anterior MI
begin
  step1;
  TypeSignalAnterior;
end;

procedure TForm1.Button3Click(Sender: TObject);   // Sinyal Inferior MI
begin
  step1;
  TypeSignalInferior;
end;

procedure TForm1.Button4Click(Sender: TObject);   // Sinyal Lateral MI
begin
  step1;
  TypeSignalLateral;
end;

procedure TForm1.Button5Click(Sender: TObject);   // Sinyal Septal MI
begin
  step1;
  TypeSignalSeptal;
end;

procedure TForm1.Button6Click(Sender: TObject);   // Sinyal Pozterior MI
begin
  step1;
  TypeSignalPosterior;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  ListBox7.SelectAll;
  Clipboard.AsText := ListBox7.Items.Text;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    Series4.Active:=True
  else
    Series4.Active:=False;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
    Series5.Active:=True
  else
    Series5.Active:=False;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
   if CheckBox3.Checked then
    Series6.Active:=True
   else
    Series6.Active:=False;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
   if CheckBox4.Checked then
    Series7.Active:=True
   else
    Series7.Active:=False;
end;

// merubah time series RR interval ke dalam angular velocity
function Tform1.omega(input:real):Real;
var
  i : Integer;
begin
  i := Floor(input/(2*fsecg));
  omega := 2*pi/after[i];
end;

// salah satu bagian dari perhitungan sumbu z dynamical model utk menghitung teta
function TForm1.arctan2(y:Real;x:Real): Real;
begin
  arctan2:=2*(ArcTan(y/(sqrt(Sqr(x)+sqr(y))+x)));
end;

// Sumbu x pada dynamical model
function TForm1.Xdynamical (t0:Real; x0:Real; y0:Real): Real;
var
  alfa : Extended;
  begin
    alfa := 1-sqrt(Sqr(x0)+Sqr(y0));
    Xdynamical := (alfa*x0)-(omega(t0)*y0);
  end;

// Sumbu y pada dynamical model
function TForm1.Ydynamical (t0:Real; x0:Real; y0:Real): Real;
var
  alfa : Extended;
  begin
    alfa := 1-sqrt(Sqr(x0)+Sqr(y0));
    Ydynamical := (alfa*y0) + (omega(t0)*x0);
  end;

// Sumbu z sekaligus pembentuk morfologi sinyal pada dynamical model
function TForm1.Zdynamical (t0:Real; x0:Real; y0:Real; z0: Real) : Real;
var
  sum,teta,z_0,delta,sq_delta,sq_b : Real;
  i : Integer;

  begin
    sum:= 0;
    z_0 := 0.00015*Sin(2*Pi*t0*f2);  // baseline wander
    teta := arctan2(y0,x0);
    for i := 1 to ParAmount do

    begin
      delta :=  modul(teta-ti[i],2*Pi)-Pi;
      sq_delta := Sqr(delta);
      sq_b := Sqr(bi[i]);
      sum := sum + (-ai[i]*delta*Exp((-0.5)*sq_delta/sq_b));
    end;

    sum := sum-(z0-z_0);
    Zdynamical := sum;

  end;

// salah satu bagian dari perhitungan sumbu z menghitung modulo
function TForm1.modul(input1 : real; input2: Real) :real;
begin
  Result :=0;
  if Abs(input1) < input2 then
  begin
    if input1 < 0 then Result := input1+input2
    else if input1 = 0 then Result := 0
    else if input1 > 0 then Result := input1;
  end
  else if (input1) > 0 then
  begin
    while input1 > input2 do input1 := input1 - input2;
    Result := input1;
  end
  else if (input1) < 0 then
  begin
    while input1 < 0 do input1 := input1 + input2;
    result := input1;
  end;

end;

//PARAMETER NORMAL 12 LEAD
procedure TForm1.normal1;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=30*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-7.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.5*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.75*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.normal2;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=1.2*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-6*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=52.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.67*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=1*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.normal3;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-6*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=33.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.3*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.normalaVR;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=-0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-30*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=-0.5*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=-0.75*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.normalaVL;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=-0.2*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=7*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-15*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.17*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.normalaVF;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=1*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-6*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=40*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.4*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.6*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.normalV1;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=4*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-37.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-1*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.17*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.normalV2;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=10*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-67.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-1*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.9*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=1.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.normalV3;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=18*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-33.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-1*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=1*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=2*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.normalV4;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=45*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-15*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=1*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=2*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.normalV5;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=48.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=1*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=1.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.normalV6;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=45*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.8*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.9*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

//PARAMETER ANTERIOR 12 LEAD
procedure TForm1.anterior1;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=30*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-7.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.5*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.75*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.anterior2;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=30*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.2*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.3*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.anterior3;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=9*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-18.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.15*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.anterioraVR;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=-0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-30*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=-0.5*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=-0.75*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.anterioraVL;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=33.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.2*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.3*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.anterioraVF;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-4*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=18.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.2*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.anteriorV1;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=-0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-41.25*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-1*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.75*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.55*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.anteriorV2;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=7*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-67.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-1*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.85*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=1.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.anteriorV3;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=15*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-37.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=25*ModFactor;
  ai[4]:=2.5*18;
  bi[4]:=0.2*ModFactor;
  ti[5]:=67*Sqrt(ModFactor);
  ai[5]:=2.5*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=70*Sqrt(ModFactor);
  ai[6]:=2.7*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.anteriorV4;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=45*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-18.75*18;
  bi[4]:=0.13*ModFactor;
  ti[5]:=67*Sqrt(ModFactor);
  ai[5]:=1.7*Power(ModFactor,(2.5))*18;
  bi[5]:=0.45*Power(modFactor,(-1));
  ti[6]:=70*Sqrt(ModFactor);
  ai[6]:=2.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.25*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.anteriorV5;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=48.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=1*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=1.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.anteriorV6;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=45*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.8*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.9*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

//PARAMETER INFERIOR 12 LEAD
procedure TForm1.inferior1;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=37.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-7*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.25*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.35*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.inferior2;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=1.2*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-6*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=52.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.2*ModFactor;
  ti[5]:=67*Sqrt(ModFactor);
  ai[5]:=1.67*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=70*Sqrt(ModFactor);
  ai[6]:=2.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.inferior3;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-6*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=33.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.2*ModFactor;
  ti[5]:=67*Sqrt(ModFactor);
  ai[5]:=0.9*Power(ModFactor,(2.5))*18;
  bi[5]:=0.45*Power(modFactor,(-1));
  ti[6]:=70*Sqrt(ModFactor);
  ai[6]:=1.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.25*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.inferioraVR;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=-0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-26.25*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=2*18;
  bi[4]:=0.15*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=-0.3*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=-0.4*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.inferioraVL;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=41.25*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-0.5*18;
  bi[4]:=0.2*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=-0.8*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=-1*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.inferioraVF;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-6*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=41.25*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.2*ModFactor;
  ti[5]:=67*Sqrt(ModFactor);
  ai[5]:=1.2*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=70*Sqrt(ModFactor);
  ai[6]:=2*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.inferiorV1;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-32*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-1*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.51*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.75*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.inferiorV2;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=15.75*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-37.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-1*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.56*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.83*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.inferiorV3;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=23*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-33.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-1*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.7*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.8*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.inferiorV4;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=45*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-15*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=1*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=2*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.inferiorV5;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=48.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=1*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=1.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.inferiorV6;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=45*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.8*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.9*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

//PARAMETER LATERAL 12 LEAD
procedure TForm1.lateral1;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=30*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-7.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=77*Sqrt(ModFactor);
  ai[5]:=0.83*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=80*Sqrt(ModFactor);
  ai[6]:=1.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.lateral2;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=1.2*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-6*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=22.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.17*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.lateral3;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=26.25*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-11.25*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.25*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.3*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.lateralaVR;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=-0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=8*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-37.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=-0.3*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=-0.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.lateralaVL;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-13*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=38*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=1*18;
  bi[4]:=0.2*ModFactor;
  ti[5]:=67*Sqrt(ModFactor);
  ai[5]:=0.68*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=70*Sqrt(ModFactor);
  ai[6]:=1*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.lateralaVF;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=30*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-11.25*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.3*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.lateralV1;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-30*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-0.5*18;
  bi[4]:=0.25*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.25*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.35*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.lateralV2;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=10*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-53.3*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-1*18;
  bi[4]:=0.2*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.7*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=1.04*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.lateralV3;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=15*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-31*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-1*18;
  bi[4]:=0.2*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.9*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=1.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.lateralV4;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=45*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-17*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=1*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=2*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.lateralV5;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=48.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-7.5*18;
  bi[4]:=0.12*ModFactor;
  ti[5]:=87*Sqrt(ModFactor);
  ai[5]:=1.34*Power(ModFactor,(2.5))*18;
  bi[5]:=0.45*Power(modFactor,(-1));
  ti[6]:=90*Sqrt(ModFactor);
  ai[6]:=2*Power(ModFactor, (2.5))*18;
  bi[6]:=0.25*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.lateralV6;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=45*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=1*18;
  bi[4]:=0.2*ModFactor;
  ti[5]:=77*Sqrt(ModFactor);
  ai[5]:=1.8*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=80*Sqrt(ModFactor);
  ai[6]:=2*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;


// pengintegrasian dengan rungekutta orde 4
procedure TForm1.rungekutta;
var
  h : real;
  k : array [0..5,0..5] of Extended;
  i,jumlah : integer;
begin
  Series1.Clear;
  x[0] := 0.1;
  y[0] := 0;
  z[0] := 0;
  fsecg := StrToInt(Edit18.Text);
  h:= 1/(2*fsecg);
  jumlah:= strtoint(Edit1.text);
  i := 0;
  while i < (jumlah*2*fsECG)-1 do
  begin
    //k1 for x, y, and z
    k[1,1] := Xdynamical((i/(2*fsECG)),x[i],y[i]);
    k[1,2] := Ydynamical((i/(2*fsECG)),x[i],y[i]);
    k[1,3] := Zdynamical((i/(2*fsECG)),x[i],y[i],z[i]);
    //k2 for x, y, and z
    k[2,1] := Xdynamical((i/(2*fsECG)),(x[i]+(0.5*h)),(y[i]+(0.5*k[1,2]*h)));
    k[2,2] := Ydynamical((i/(2*fsECG)),(x[i]+(0.5*h)),(y[i]+(0.5*k[1,2]*h)));
    k[2,3] := Zdynamical((i/(2*fsECG)),(x[i]+(0.5*h)),(y[i]+(0.5*k[1,2]*h)),(z[i]+(0.5*k[1,3]*h)));
    //k3 for x, y, and z
    k[3,1] := Xdynamical((i/(2*fsECG)),(x[i]+(0.5*h)),(y[i]+(0.5*k[2,2]*h)));
    k[3,2] := Ydynamical((i/(2*fsECG)),(x[i]+(0.5*h)),(y[i]+(0.5*k[2,2]*h)));
    k[3,3] := Zdynamical((i/(2*fsECG)),(x[i]+(0.5*h)),(y[i]+(0.5*k[2,2]*h)),(z[i]+(0.5*k[2,3]*h)));
    //k4 for x, y, and z
    k[4,1] := Xdynamical((i/(2*fsECG)),(x[i]+h),(y[i]+(k[3,2]*h)));
    k[4,2] := Ydynamical((i/(2*fsECG)),(x[i]+h),(y[i]+(k[3,2]*h)));
    k[4,3] := Zdynamical((i/(2*fsECG)),(x[i]+h),(y[i]+(k[3,2]*h)),(z[i]+(k[3,3]*h)));
    //x, y, and z value update
    x[i+1] := x[i] + ((h/6)*(k[1,1]+(2*k[2,1])+(2*k[3,1])+k[4,1]));
    y[i+1] := y[i] + ((h/6)*(k[1,2]+(2*k[2,2])+(2*k[3,2])+k[4,2]));
    z[i+1] := z[i] + ((h/6)*(k[1,3]+(2*k[2,3])+(2*k[3,3])+k[4,3]));
    ListBox7.Items.Add(FloatToStr(z[i]));
    Inc(i);
    Series1.AddXY((i/(2*fsECG)),z[i]);

    //ListBox7.Items.Add(FloatToStr(z[i]));
    //ListBox5.Items.Add(FloatToStr(i/(2*fsecg)));
  end;
end;


//PARAMETER SEPTAL 12 LEAD
procedure TForm1.septal1;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=30*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-7.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.5*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.75*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.septal2;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=1.2*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-6*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=52.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.67*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=1*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.septal3;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-6*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=33.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.3*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.septalaVR;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=-0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-30*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=-0.5*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=-0.75*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.septalaVL;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=-0.2*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=7*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-15*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.17*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.septalaVF;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=1*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-6*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=40*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.4*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.6*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.septalV1;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-1*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-37.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=1*18;
  bi[4]:=0.3*ModFactor;
  ti[5]:=67*Sqrt(ModFactor);
  ai[5]:=1.02*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=70*Sqrt(ModFactor);
  ai[6]:=1.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.septalV2;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-49.7*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=1*18;
  bi[4]:=0.2*ModFactor;
  ti[5]:=67*Sqrt(ModFactor);
  ai[5]:=1.5*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=70*Sqrt(ModFactor);
  ai[6]:=1.85*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.septalV3;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=18*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-33.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-1*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=1*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=2*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.septalV4;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=45*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-15*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=1*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=2*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.septalV5;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=48.75*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=1*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=1.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.septalV6;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=45*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.8*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.9*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

//PARAMETER POSTERIOR 12 LEAD
procedure TForm1.posterior1;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=33*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.4*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.6*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.posterior2;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=7*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-13.8*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.17*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.posterior3;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=1.2*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-30*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.23*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.36*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.posterioraVR;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=-0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=10*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-26.3*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=-0.17*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=-0.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.posterioraVL;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-7*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=30*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=-0.17*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=-0.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.posterioraVF;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=4*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=-22.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.15*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.posteriorV1;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=45*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-15*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.68*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=1*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.posteriorV2;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=35*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-17*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.7*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=1.04*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.posteriorV3;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=30*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=-17*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.7*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.83*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.posteriorV4;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=0.5*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=56.25*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.4*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.5*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.posteriorV5;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-10*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=56.25*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=0.17*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=0.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;

procedure TForm1.posteriorV6;
var
  i : Integer;
begin
  modFactor := Sqrt(hmean/60);
  ti[1]:=-60*Sqrt(ModFactor);
  ai[1]:=0.8*18;
  bi[1]:=0.2*ModFactor;
  ti[2]:=-15*ModFactor;
  ai[2]:=-10*18;
  bi[2]:=0.1*ModFactor;
  ti[3]:=0;
  ai[3]:=37.5*18;
  bi[3]:=0.1*ModFactor;
  ti[4]:=15*ModFactor;
  ai[4]:=0.5*18;
  bi[4]:=0.1*ModFactor;
  ti[5]:=97*Sqrt(ModFactor);
  ai[5]:=-0.17*Power(ModFactor,(2.5))*18;
  bi[5]:=0.4*Power(modFactor,(-1));
  ti[6]:=100*Sqrt(ModFactor);
  ai[6]:=-0.25*Power(ModFactor, (2.5))*18;
  bi[6]:=0.2*ModFactor;

  for i:=1 to 6 do
  begin
    ti[i]:=ti[i]*pi/180 //ubah ke rad
  end;

end;


//NORMAL
procedure TForm1.TypeSignalNormal;
begin
  if RadioButton7.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    normal1;
    rungekutta;
  end
  else
  if RadioButton8.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    normal2;
    rungekutta;
  end
  else
  if RadioButton9.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    normal3;
    rungekutta;
  end
  else
  if RadioButton10.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    normalaVR;
    rungekutta;
  end
  else
  if RadioButton11.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    normalaVL;
    rungekutta;
  end
  else
  if RadioButton12.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    normalaVF;
    rungekutta;
  end
  else
  if RadioButton13.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    normalV1;
    rungekutta;
  end
  else
  if RadioButton14.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    normalV2;
    rungekutta;
  end
  else
  if RadioButton15.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    normalV3;
    rungekutta;
  end
  else
  if RadioButton16.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    normalV4;
    rungekutta;
  end
  else
  if RadioButton17.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    normalV5;
    rungekutta;
  end
  else
  if RadioButton18.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    normalV6;
    rungekutta;
  end

end;

//ANTERIOR
procedure TForm1.typeSignalAnterior;
begin

  if RadioButton7.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    anterior1;
    rungekutta;
  end
  else
  if RadioButton8.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    anterior2;
    rungekutta;
  end
  else
  if RadioButton9.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    anterior3;
    rungekutta;
  end
  else
  if RadioButton10.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    anterioraVR;
    rungekutta;
  end
  else
  if RadioButton11.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    anterioraVL;
    rungekutta;
  end
  else
  if RadioButton12.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    anterioraVF;
    rungekutta;
  end
  else
  if RadioButton13.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    anteriorV1;
    rungekutta;
  end
  else
  if RadioButton14.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    anteriorV2;
    rungekutta;
  end
  else
  if RadioButton15.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    anteriorV3;
    rungekutta;
  end
  else
  if RadioButton16.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    anteriorV4;
    rungekutta;
  end
  else
  if RadioButton17.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    anteriorV5;
    rungekutta;
  end
  else
  if RadioButton18.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    anteriorV6;
    rungekutta;
  end

end;

//INFERIOR
procedure TForm1.typeSignalInferior;
begin

  if RadioButton7.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    inferior1;
    rungekutta;
  end
  else
  if RadioButton8.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    inferior2;
    rungekutta;
  end
  else
  if RadioButton9.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    inferior3;
    rungekutta;
  end
  else
  if RadioButton10.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    inferioraVR;
    rungekutta;
  end
  else
  if RadioButton11.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    inferioraVL;
    rungekutta;
  end
  else
  if RadioButton12.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    inferioraVF;
    rungekutta;
  end
  else
  if RadioButton13.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    inferiorV1;
    rungekutta;
  end
  else
  if RadioButton14.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    inferiorV2;
    rungekutta;
  end
  else
  if RadioButton15.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    inferiorV3;
    rungekutta;
  end
  else
  if RadioButton16.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    inferiorV4;
    rungekutta;
  end
  else
  if RadioButton17.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    inferiorV5;
    rungekutta;
  end
  else
  if RadioButton18.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    inferiorV6;
    rungekutta;
  end

end;

//LATERAL
procedure TForm1.typeSignalLateral;
begin

  if RadioButton7.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    lateral1;
    rungekutta;
  end
  else
  if RadioButton8.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    lateral2;
    rungekutta;
  end
  else
  if RadioButton9.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    lateral3;
    rungekutta;
  end
  else
  if RadioButton10.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    lateralaVR;
    rungekutta;
  end
  else
  if RadioButton11.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    lateralaVL;
    rungekutta;
  end
  else
  if RadioButton12.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    lateralaVF;
    rungekutta;
  end
  else
  if RadioButton13.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    lateralV1;
    rungekutta;
  end
  else
  if RadioButton14.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    lateralV2;
    rungekutta;
  end
  else
  if RadioButton15.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    lateralV3;
    rungekutta;
  end
  else
  if RadioButton16.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    lateralV4;
    rungekutta;
  end
  else
  if RadioButton17.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    lateralV5;
    rungekutta;
  end
  else
  if RadioButton18.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    lateralV6;
    rungekutta;
  end

end;

//SEPTAL
procedure TForm1.typeSignalSeptal;
begin

  if RadioButton7.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    septal1;
    rungekutta;
  end
  else
  if RadioButton8.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    septal2;
    rungekutta;
  end
  else
  if RadioButton9.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    septal3;
    rungekutta;
  end
  else
  if RadioButton10.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    septalaVR;
    rungekutta;
  end
  else
  if RadioButton11.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    septalaVL;
    rungekutta;
  end
  else
  if RadioButton12.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    septalaVF;
    rungekutta;
  end
  else
  if RadioButton13.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    septalV1;
    rungekutta;
  end
  else
  if RadioButton14.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    septalV2;
    rungekutta;
  end
  else
  if RadioButton15.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    septalV3;
    rungekutta;
  end
  else
  if RadioButton16.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    septalV4;
    rungekutta;
  end
  else
  if RadioButton17.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    septalV5;
    rungekutta;
  end
  else
  if RadioButton18.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    septalV6;
    rungekutta;
  end

end;

//POSTERIOR
procedure TForm1.typeSignalPosterior;
begin

  if RadioButton7.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    posterior1;
    rungekutta;
  end
  else
  if RadioButton8.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    posterior2;
    rungekutta;
  end
  else
  if RadioButton9.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    posterior3;
    rungekutta;
  end
  else
  if RadioButton10.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    posterioraVR;
    rungekutta;
  end
  else
  if RadioButton11.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    posterioraVL;
    rungekutta;
  end
  else
  if RadioButton12.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    posterioraVF;
    rungekutta;
  end
  else
  if RadioButton13.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    posteriorV1;
    rungekutta;
  end
  else
  if RadioButton14.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    posteriorV2;
    rungekutta;
  end
  else
  if RadioButton15.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    posteriorV3;
    rungekutta;
  end
  else
  if RadioButton16.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    posteriorV4;
    rungekutta;
  end
  else
  if RadioButton17.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    posteriorV5;
    rungekutta;
  end
  else
  if RadioButton18.Checked = true then
  begin
    parAmount := 6;
    iterRK := 0;
    posteriorV6;
    rungekutta;
  end

end;


end.
