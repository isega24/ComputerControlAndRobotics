$regfile = "m8def.dat"
$crystal = 8000000

Config Pinb.0 = Input
Config Pinb.1 = Input
Config Pinb.2 = Output
Config Pinb.3 = Output
Config LCD = 16*2
Config Timer0 = Timer , Prescale = 1024

On Timer0 Mult_kl

Dim Temp1 As Byte
Dim Temp2 as Byte
Dim toOutput as byte
Dim I as byte

W1 alias Pinb.0
W2 alias pinb.1
kol1 alias portb.2
kol2 alias portb.3

enable Interrupts

enable timer0

load Timer0 , 200

Set Portb.0
set portb.1
set kol1
set kol2

do
   cls
   Lcd toOutput
   waitms 100
loop
end


Mult_kl:
   load timer0 , 200
   for I = 1 to 2
      if I = 1 then
         reset kol1
      else
         set kol1
         reset kol2
      end if
      if W1 = 0 or W2 = 0 then
         temp1 = Pinb and &B00000011
      exit for
   else
      temp1 = 0
   end if
next I
if temp2 = temp1 then
   toOutput = temp1
   if I = 2 then
      toOutput = toOutput+2
   end if
else
   temp2 = temp1
end if
set kol1
set kol2
return
