unit FitnessApp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeeProcs, TeEngine, Chart, ComCtrls, Series,
  TeeFunci, Grids, Buttons, jpeg, Menus;

type

  TForm1 = class(TForm)
    acinf: TPanel;
    accList: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    acCr: TPanel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Create_btn: TButton;
    ComboBox1: TComboBox;
    Edit5: TEdit;
    Label6: TLabel;
    ODBACC: TPageControl;
    TabSheet1: TTabSheet;
    Button5: TButton;
    Button6: TButton;
    Chart1: TChart;
    TabSheet2: TTabSheet;
    Edit4: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    ComboBox2: TComboBox;
    Edit6: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Editsh_B: TButton;
    EditacOK_B: TButton;
    EditacNO_B: TButton;
    cal_label: TLabel;
    cal2_Label: TLabel;
    intvez_CB: TComboBox;
    Label17: TLabel;
    Label18: TLabel;
    BMI_L: TLabel;
    Bevel1: TBevel;
    Label19: TLabel;
    Series1: TPieSeries;
    ListView1: TListView;
    Image1: TImage;
    izlcr: TButton;
    StaticText1: TStaticText;
    Shape1: TShape;
    StaticText2: TStaticText;
    Shape2: TShape;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    Shape3: TShape;
    Shape4: TShape;
    Panel1: TPanel;
    StaticText5: TStaticText;
    Button7: TButton;
    Edit9: TEdit;
    Image2: TImage;
    H1_Pop: TPopupMenu;
    Dodadi1: TMenuItem;
    H3: TListView;
    H3_Pop: TPopupMenu;
    Izbrisi1: TMenuItem;
    Izbrisise1: TMenuItem;
    N1: TMenuItem;
    Acc_Pop: TPopupMenu;
    Oberi1: TMenuItem;
    N2: TMenuItem;
    Izbrisi2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Create_btnClick(Sender: TObject);
    procedure intvez_CBChange(Sender: TObject);
    procedure Editsh_BClick(Sender: TObject);
    procedure EditacNO_BClick(Sender: TObject);
    procedure TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure EditacOK_BClick(Sender: TObject);
    procedure izlcrClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure BMI_LMouseEnter(Sender: TObject);
    procedure BMI_LMouseLeave(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Edit9Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Dodadi1Click(Sender: TObject);
    procedure Izbrisi1Click(Sender: TObject);
    procedure Izbrisise1Click(Sender: TObject);
    procedure Oberi1Click(Sender: TObject);
    procedure Izbrisi2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  ime,pol: string;
  visina,tez,god,vkcal:integer;
  eint,VM:real;
  z:integer;
  Hbaraj:TStringList;

implementation


////////////////////////////////////////////////////////////////////////////////////////
//Funkcii
////////////////////////////////////////////////////////////////////////////////////////


procedure izbrisiCal(H3:Tlistview;var vkcal:integer);
  var     hl:TStringList;
      i,j,grama,ind,cal2:integer;
      text,Hime,Cal:string;
begin
  hl:=TStringList.Create;
  hl.LoadFromFile('hrana.txt');
  for i := 0 to hl.Count-1 do
  begin
     text:=hl[i];
     for j:=1 to length(text) do
       if text[j] = '/' then
        break;

  Hime:=copy(text,0,j-1);
  Cal:=copy(text,j+1,length(text));
 if  h3.ItemIndex>-1 then
    begin
   if Hime=h3.Items.Item[h3.ItemIndex].Caption then
      begin
      val(h3.Items[h3.ItemIndex].SubItems.GetText,grama,ind);
      cal2:=trunc((strtoint(cal)/100)*grama);

      vkcal:=vkcal-cal2;

      h3.DeleteSelected;

      break;
      end;
    end;
  end;
  hl.Free;
end;

procedure DodajCal(HV,H3:Tlistview;var cal2:real);
  var     hl:TStringList;
      i,j,grama,ind:integer;
      text,Hime,Cal:string;
      vNewItem: TListItem;
begin
val(InputBox('Fitness', 'Kolku grama e hranata', '100'),grama,ind);
  hl:=TStringList.Create;
  hl.LoadFromFile('hrana.txt');
  for i := 0 to hl.Count-1 do
  begin
     text:=hl[i];
     for j:=1 to length(text) do
       if text[j] = '/' then
        break;
  Hime:=copy(text,0,j-1);
  Cal:=copy(text,j+1,length(text));

  if Hime=hv.Items.Item[hv.ItemIndex].Caption then
    begin
    vNewItem := H3.Items.Add;
    vNewItem.Caption := Hime;
    cal2:=(strtoint(cal)/100)*grama;
    vNewItem.SubItems.Add(floattostr(grama));
    end;
  end;

  hl.Free;
end;

function prspzn(edit1:Tedit):Boolean;
var st:string;
    i:integer;
begin
prspzn:=false;
st:=edit1.Text;
for i:=1 to length(st) do
  if st[i] = '/' then
   begin
   prspzn:=true;
   break;
   end;

end;

function citajHr( HV:Tlistview):integer;
var hl:TStringList;
    i,j:integer;
    text,Hime,Cal:string;
    vNewItem: TListItem;
begin
HV.Items.Clear;
hl:=TStringList.Create;
hl.LoadFromFile('hrana.txt');

for i := 0 to hl.Count-1 do
begin
  text:=hl[i];
    for j:=1 to length(text) do
      if text[j] = '/' then
        break;

  Hime:=copy(text,0,j-1);
  Cal:=copy(text,j+1,length(text));

  vNewItem := HV.Items.Add;
  vNewItem.Caption := Hime;
  vNewItem.SubItems.Add(cal);
end;

hl.Free;
result:=0;
end;


function BMI(vis:real;tez:integer):real;
begin
BMI := tez/sqr(vis);
end;


function BMR(vis,tez,god:integer;pol:string):real;
begin
if pol='M' then
BMR:=66.47+(13.75 * tez) + (5.0 * vis) - (6.75 * god)
else
BMR:=665.09 + (9.56 * tez) + (1.84 * vis) - (4.67 * god);
end;


function oslab(ime,pol:string;vis,tez,god:integer;lime,lvis,ltez,lpol,lgod,BMI_L,Cal2_Label:Tlabel):integer;
  begin
  lime.Caption:=ime;
  lvis.Caption:=inttostr(vis);
  ltez.Caption:=inttostr(tez);

  if(pol='M')then
  lpol.Caption:='M'
  else
  lpol.Caption:='Z';

  lgod.Caption:=inttostr(god);
  BMI_L.Caption:=floattostr(int(BMI(vis/100,tez)));
  cal2_label.Caption:= inttostr(trunc(bmr(vis,tez,god,pol)*eint));

  if BMI(visina/100,tez)>30 then
      BMI_L.Color:=RGB(235,5,0)
  else if (BMI(visina/100,tez)<30) and (BMI(visina/100,tez)>25) then
      BMI_L.Color:=RGB(255,255,80)
  else if (BMI(visina/100,tez)<25) and (BMI(visina/100,tez)>18.5) then
      BMI_L.Color:=RGB(171,171,17)
  else
      BMI_L.Color:=RGB(44,147,222);

  result:=0;
  end;


procedure acstat(ime:string;var vis,tez,god,pol:string);
var   account :TextFile;
ime2,text: string;
    i:integer;
   var c1,c2,c3,c4:integer;
begin
AssignFile(account, 'Account.txt');
Reset(account);
while not Eof(account) do
begin
  ReadLn(account, text);
c1:=0;
c2:=0;
c3:=0;
c4:=0;


     for i:=1 to length(text) do
       if text[i] = '/' then
          begin
           if c1=0 then
              c1:=i
           else if c2=0 then
              c2:=i
           else if c3=0 then
              c3:=i
           else if  c4=0 then
              begin
              c4:=i;
              break;
              end;
          end;
  ime2:=copy(text,0,c1-1);

  if ime=ime2 then
  begin

   vis:=copy(text,c1+1,c2-c1-1);
  tez:=copy(text,c2+1,c3-c2-1);
  god:=copy(text,c3+1,c4-c3-1);
  pol:=copy(text,length(text),length(text));
  break;
  close(account);
  end;
end;
close(account );
end;

////////////////////////////////////////////////////////////////////////////////////////
//Funkcii
///////////////////////////////////////////////////////////////////////////////////////


function proveriime(ime:string):boolean;
var   account :TextFile;
ime2,text: string;
    i:integer;
begin
 proveriime:=false;
AssignFile(account, 'Account.txt');
Reset(account);
while not Eof(account) do
begin
  ReadLn(account, text);
     for i:=1 to length(text) do
      if text[i] = '/' then
        break;
      ime2:=copy(text,0,i-1);
  if ime=ime2 then
  begin
  proveriime:=true;
  break;
  close(account);
  end;
end;
close(account );
end;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var  myFile : TextFile;
  text,ime   : string;
    i:integer;
begin

Hbaraj:=TStringList.Create;
Hbaraj.LoadFromFile('hrana.txt');

panel1.Color:=RGB(222,211,189);
Shape4.Brush.Color:=RGB(235,5,0);
Shape3.Brush.Color:=RGB(255,255,80);
Shape2.Brush.Color:=RGB(171,171,17) ;
Shape1.Brush.Color:=RGB(44,147,222);

image1.Top:=0;
image1.Left:=0;
image1.Width:=form1.Width-20;
image1.Height:=form1.Height-40;

eint:=1.2;
cal2_label.Caption:= floattostr(bmr(visina,tez,god,pol)*eint);
intvez_cb.ItemIndex:=0;
AssignFile(myFile, 'Account.txt');
Reset(myFile);
while not Eof(myFile) do
begin
  ReadLn(myFile, text);
  for i:=1 to length(text) do
    if text[i] = '/' then
      break;
  ime:=copy(text,0,i-1);
  acclist.Items.Add(ime);
end;
closefile(myFile);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
acinf.Visible:=false;
acCr.Visible:=true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Create_btnClick(Sender: TObject);
var adF:textfile;
    adac:string;
    ind1,ind2,ind3:integer;
    begin

ime:=edit1.text;
val(edit2.Text,visina,ind1);
val(edit3.Text,tez,ind2);
if combobox1.ItemIndex = 0 then
  pol:='M'
else if combobox1.ItemIndex = 1 then
  pol:='Z'
else
  begin
  messagedlg('Vnesete Pol',mtError,[mbOK],0);
  exit;
  end;
val(edit5.Text,god,ind3);
if (prspzn(edit1)) then
      messagedlg('Ne smee / da se koristi vo ime',mtError,[mbOK],0)
else if (ime=' ') or (visina=0) or (tez=0) or (god=0) then
  messagedlg('Vnesete tocni informacii',mtError,[mbOK],0)
else if (ind1<>0)or(ind2<>0)or(ind3<>0)then
  messagedlg('Vnesete tocni informacii',mtError,[mbOK],0)
else if proveriime(ime)=true then
messagedlg('toa ime veke e iskoristeno ve molime vnesete drugo ime',mtinformation,[mbOK],0)
else
  begin
    adac:=ime+'/'+inttostr(visina)+'/'+inttostr(tez)+'/'+inttostr(god)+'/'+pol;
    AssignFile(adF, 'account.txt') ;
    Append(adF);
    WriteLn(adF, adac);
    closefile(adF);
    if proveriime(ime)=true then
      begin
      messagedlg('Vnesuvanjeto bese uspesno!',mtinformation,[mbOK],0);
      ODBACC.Visible:=true;
      accr.Visible:=false;
      
      citajhr(listview1);

      oslab(ime,pol,visina,tez,god,Label12,Label13,Label14,Label15,Label16,BMI_L,Cal2_Label);

      end
    else
      messagedlg('Vnesuvanjeto ne bese uspesno',mterror,[mbOK],0);
  end;
end;



procedure TForm1.intvez_CBChange(Sender: TObject);
begin
case intvez_CB.ItemIndex of
0:begin eint:=1.2 end;
1:begin eint:=1.375 end;
2:begin eint:=1.55 end;
3:begin eint:=1.725 end;
4:begin eint:=1.9 end;
END;

cal2_label.Caption:= inttostr(trunc(bmr(visina,tez,god,pol)*eint));


end;

procedure TForm1.Editsh_BClick(Sender: TObject);
begin
editsh_B.Visible:=false;
EditacOK_B.Visible:=true;
EditacNO_B.Visible:=true;

edit8.Visible:=true;
edit7.Visible:=true;
combobox2.Visible:=true;
edit6.Visible:=true;
edit4.Visible:=true;

edit8.text:=Label12.Caption;
edit7.text:=Label13.Caption;
edit6.text:=Label14.Caption;
edit4.text:=Label16.Caption;

  if(pol='M')then
  combobox2.ItemIndex:=0
  else
    combobox2.ItemIndex:=1;
end;

procedure TForm1.EditacNO_BClick(Sender: TObject);
begin
editsh_B.Visible:=true;
EditacOK_B.Visible:=false;
EditacNO_B.Visible:=false;

edit8.Visible:=false;
edit7.Visible:=false;
edit6.Visible:=false;
edit4.Visible:=false;
combobox2.Visible:=false;
end;

procedure TForm1.TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  citajhr(Listview1);
end;

procedure TForm1.EditacOK_BClick(Sender: TObject);
var el:TStringlist;
    imebaraj,imenovo,smac,text:string;
    ind1,ind2,ind3,i,j:integer;
begin
imenovo:=edit8.text;
val(edit7.Text,visina,ind1);
val(edit6.Text,tez,ind2);
if combobox2.ItemIndex = 0 then
  pol:='M'
else if combobox2.ItemIndex = 1 then
  pol:='Z'
else
  begin
  messagedlg('Vnesete Pol',mtError,[mbOK],0);
  exit;
  end;
val(edit4.Text,god,ind3);
if (prspzn(edit1)) then
         messagedlg('Ne smee / da se koristi vo ime',mtError,[mbOK],0)
else if (ime=' ') or (visina=0) or (tez=0) or (god=0) then
  messagedlg('Vnesete tocni informacii',mtError,[mbOK],0)
else if (ind1<>0)or(ind2<>0)or(ind3<>0)then
  messagedlg('Vnesete tocni informacii',mtError,[mbOK],0)
else
  begin

   el:=TStringList.Create;
   el.LoadFromFile('Account.txt');
   for i := 0 to el.Count-1 do
     begin
     text:=el[i];
      for j:=1 to length(text) do
        if text[j] = '/' then
         break;

  imebaraj:=copy(text,0,j-1);

    if ime=imebaraj then
   begin
   el.Delete(i);
   smac:=imenovo+'/'+inttostr(visina)+'/'+inttostr(tez)+'/'+inttostr(god)+'/'+pol;
   el.Add(smac);
   el.SaveToFile('Account.txt');
   el.Free;
   ime:=imenovo;
   break;
   end;
    end;
//    AssignFile(adF, 'account.txt') ;
//    Append(adF);
 //   WriteLn(adF, adac);
 //   closefile(adF);
    if proveriime(imenovo)=true then
      begin
      messagedlg('Vnesuvanjeto bese uspesno!',mtinformation,[mbOK],0);
      oslab(ime,pol,visina,tez,god,Label12,Label13,Label14,Label15,Label16,BMI_L,Cal2_Label);

      editsh_B.Visible:=true;
      EditacOK_B.Visible:=false;
      EditacNO_B.Visible:=false;

      edit8.Visible:=false;
      edit7.Visible:=false;
      edit6.Visible:=false;
      edit4.Visible:=false;
      combobox2.Visible:=false;


      end
    else
      messagedlg('Vnesuvanjeto ne bese uspesno',mterror,[mbOK],0);
   end;
 end;



procedure TForm1.izlcrClick(Sender: TObject);
begin
accr.Visible:=false;
acinf.Visible:=true;
{potrebnical:=bmr(visina,tez,god,pol)*eint;
chart1.Series[0].Clear;
chart1.Series[0].Add((potrebnical-vkcal),'zdravo',clred);
chart1.Series[0].Add(vkcal,'zdrav',clgray);
}end;

procedure TForm1.Button8Click(Sender: TObject);
begin
//   inputbox('Test program', 'Please type your town', 'Cardiff');

end;

procedure TForm1.BMI_LMouseEnter(Sender: TObject);
begin
panel1.Visible:=true;
end;

procedure TForm1.BMI_LMouseLeave(Sender: TObject);
begin
panel1.Visible:=false;
end;


procedure TForm1.Edit9Change(Sender: TObject);
var Hime,Cal,text,BIme:string;
    vNewItem:TListItem;
    i,j:integer;
begin
ListView1.Items.Clear;


for i := 0 to Hbaraj.Count-1 do
begin
  BIme:='';
  text:=Hbaraj[i];
    for j:=1 to length(text) do
      if text[j] = '/' then
        break;

  Hime:=copy(text,0,j-1);
 Cal:=copy(text,j+1,length(text));
  for j:=1 to length(Hime) do
  begin
  BIme:=BIme+Hime[j];
  if LowerCase(BIme) = LowerCase(edit9.Text) then
  begin
  vNewItem := ListView1.Items.Add;
  vNewItem.Caption := Hime;
  vNewItem.SubItems.Add(cal);
  break;
  end
  else if edit9.Text='' then
  begin
  vNewItem := ListView1.Items.Add;
  vNewItem.Caption := Hime;
  vNewItem.SubItems.Add(cal);
  break;
  end;
  end;
end;
end;

procedure TForm1.Edit9Click(Sender: TObject);
begin
Edit9.Text:='';
edit9.Font.Color:=clwhite;
edit9.Font.Style:=[fsBold];
end;

procedure TForm1.ListView1DblClick(Sender: TObject);
begin
{var potrebnical:integer;
begin
statictext5.Visible:=false;
DodajCal(listview1,H3_L,vkcal);
potrebnical:=trunc(bmr(visina,tez,god,pol)*eint);
label19.Caption:=inttostr(vkcal)+' / '+inttostr(potrebnical);;
chart1.Series[0].Clear;
if potrebnical-vkcal < 0 then
  begin
  chart1.Series[0].Add((abs(potrebnical-vkcal)),'Visok calorii',clred);
  chart1.Series[0].Add(vkcal,'Vneseni Kalorii',cllime);
  end
else
  begin
  chart1.Series[0].Add((potrebnical-vkcal),'Potrebni Kalorii',clgray);
  chart1.Series[0].Add(vkcal,'Vneseni Kalorii',cllime);
  end;  }
end;

procedure TForm1.Dodadi1Click(Sender: TObject);
var potrebnical:integer;
    novical:real;
begin
novical:=0;
statictext5.Visible:=false;
DodajCal(listview1,H3,novical);
vkcal:=vkcal+trunc(novical);
potrebnical:=trunc(bmr(visina,tez,god,pol)*eint);
label19.Caption:=inttostr(vkcal)+' / '+inttostr(potrebnical);;
chart1.Series[0].Clear;
if potrebnical-vkcal < 0 then
  begin
  chart1.Series[0].Add((abs(potrebnical-vkcal)),'Visok calorii',clred);
  chart1.Series[0].Add(vkcal,'Vneseni Kalorii',cllime);
  end
else
  begin
  chart1.Series[0].Add((potrebnical-vkcal),'Potrebni Kalorii',clgray);
  chart1.Series[0].Add(vkcal,'Vneseni Kalorii',cllime);
  end;
end;

{procedure TForm1.Button6Click(Sender: TObject);
//var potrebnical:integer;
begin
potrebnical:=trunc(bmr(visina,tez,god,pol)*eint);
izbrisiCal(H3,vkcal);
label19.Caption:=inttostr(vkcal)+' / '+inttostr(potrebnical);
chart1.Series[0].Clear;
if potrebnical-vkcal < 0 then
  begin
  chart1.Series[0].Add((abs(potrebnical-vkcal)),'Visok calorii',clred);
  chart1.Series[0].Add(vkcal,'Vneseni Kalorii',cllime);
  end
else
  begin
  chart1.Series[0].Add((potrebnical-vkcal),'Potrebni Kalorii',clgray);
  chart1.Series[0].Add(vkcal,'Vneseni Kalorii',cllime);
  end;
end;               }

procedure TForm1.Izbrisi1Click(Sender: TObject);
var potrebnical:integer;
begin
potrebnical:=trunc(bmr(visina,tez,god,pol)*eint);
izbrisiCal(H3,vkcal);
label19.Caption:=inttostr(vkcal)+' / '+inttostr(potrebnical);
chart1.Series[0].Clear;
if potrebnical-vkcal < 0 then
  begin
  chart1.Series[0].Add((abs(potrebnical-vkcal)),'Visok calorii',clred);
  chart1.Series[0].Add(vkcal,'Vneseni Kalorii',cllime);
  end
else
  begin
  chart1.Series[0].Add((potrebnical-vkcal),'Potrebni Kalorii',clgray);
  chart1.Series[0].Add(vkcal,'Vneseni Kalorii',cllime);
  end;
end;

procedure TForm1.Izbrisise1Click(Sender: TObject);
var potrebnical:integer;
begin
H3.Clear;
vkcal:=0;
potrebnical:=trunc(bmr(visina,tez,god,pol)*eint);
label19.Caption:='0 / '+inttostr(potrebnical);
chart1.Series[0].Clear;
chart1.Series[0].Add(potrebnical,'Potrebni Kalorii',clgray);
chart1.Series[0].Add(0,'Vneseni Kalorii',cllime);
end;

procedure TForm1.Oberi1Click(Sender: TObject);
var s1,s2,s3,s4,obdime:string;
begin
if(acclist.ItemIndex>-1)then
begin
obdime:=acclist.Items.Strings[acclist.ItemIndex];
acstat(obdime,s1,s2,s3,s4);
ime:=obdime;

visina:=strtoint(s1);
tez:=strtoint(s2);
god:=strtoint(s3);
pol:=s4;
acinf.Visible:=false;
odbacc.Visible:=true;

 citajhr(Listview1);

 oslab(ime,pol,visina,tez,god,Label12,Label13,Label14,Label15,Label16,BMI_L,Cal2_Label);
end
else
messagedlg('Odberete Korisnik',mtinformation,[mbOK],0);

end;

procedure TForm1.Izbrisi2Click(Sender: TObject);
  var sl:TStringList;
      i,j:integer;
      text,ime2,ime1:string;
begin
  sl:=TStringList.Create;
  sl.LoadFromFile('Account.txt');
  for i := 0 to sl.Count-1 do
  begin
     text:=sl[i];
     for j:=1 to length(text) do
       if text[j] = '/' then
        break;

  ime2:=copy(text,0,j-1);
  ime1:=acclist.Items.Strings[acclist.ItemIndex];
  if ime1=ime2 then
   begin
   sl.Delete(i);
   sl.SaveToFile('Account.txt');
   break;
   end;
  end;

  acclist.Items.Clear;

  for i := 0 to sl.Count-1 do
  begin
     text:=sl[i];
     for j:=0 to length(text) do
       if text[j] = '/' then
        break;
  ime:=copy(text,0,j-1);
  acclist.Items.Add(ime);
  end;
  sl.free;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
image1.Width:=form1.Width-20;
image1.Height:=form1.Height-40;
acinf.Left:=(form1.Width div 2)-(acinf.Width div 2);
acinf.Top:=(form1.height div 2)-(acinf.height div 2);
odbacc.Left:=(form1.Width div 2)-(odbacc.Width div 2);
odbacc.Top:=(form1.height div 2)-(odbacc.height div 2);
accr.Left:=(form1.Width div 2)-(accr.Width div 2);
accr.Top:=(form1.height div 2)-(accr.height div 2);
end;

end.
