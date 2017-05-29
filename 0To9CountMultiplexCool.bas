$Regfile="m8def.dat"
$Crystal=8000000

Config Portd = OUTPUT

CONFIG pINB.0 = OUTPUT
CONFIG pINB.1 = OUTPUT
CONFIG pINB.2 = OUTPUT
CONFIG pINB.3 = OUTPUT
CONFIG TIMER0 = TIMER , prescale = 256

declare sub pobr(cifra as Byte)
on timer0 mult

dim A as Byte, B as Byte, C as Byte, D as Byte

dim nr as Byte
dim I1 as Byte, I2 as Byte, I3 as Byte, I4 as Byte
W1 alias portb.0
W2 alias portb.1
W3 alias portb.2
W4 alias portb.3

enable interrupts
enable Timer0 , 125

do
wait 1
for I1 = 0 to 9
   A = I1
   for I2 = 0 to 9
      B= I2

      for I3 = 0 to 9
         C = I3
         for I4 = 0 to 9
            D = I4
            waitms 200
            next I4
         next I3
      next I2
   next I1
wait 5


loop
end


sub pobr(cifra as byte)
   if cifra < 10 then
      portd = lookup(cifra, kody7seg)
   else
      portd = 0
   end if
end sub



mult:
   load timer0 , 125
   Set W1
   Set W2
   Set W3
   Set W4

   Select case nr

   case 0:
      call pobr(a)
      reset W1
   case 1:
      call pobr(b)
      reset W2
   case 2:
      call pobr(c)
      reset W3
   case 3:
      call pobr(d)
      reset W4

   end select

   incr nr

   if nr = 4 then

   nr = 0

   end if
return


Kody7seg:

Data &B00111111 , &B00000110 , &B01011011 , &B01001111 , &B01100110 ,
Data &B01101101 , &B01111101 , &B00000111 , &B01111111 , &B01101111
