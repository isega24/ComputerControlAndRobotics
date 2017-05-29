
$Regfile="m8def.dat"
$Crystal=8000000

Config Portb = output

Declare sub w7seg(byval C As Byte)

Dim I as Byte

Dim Cod_cif as Byte

Kropka alias Portb.7

do
   toggle kropka
   for I = 0 to 9
      call w7seg(i)
      Waitms 500
   next I

loop

End

sub w7seg(byval C as Byte)
   if C < 10 then
      Cod_cif = Lookup(c, kody7seg)
      cod_cif.7 = Kropka
      portb = cod_cif
   else
      portd = Portb and &B10000000
   end if
end Sub

Kody7seg:

Data &B00111111 , &B00000110 , &B01011011 , &B01001111 , &B01100110 ,
Data &B01101101 , &B01111101 , &B00000111 , &B01111111 , &B01101111
