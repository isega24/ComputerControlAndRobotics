$regfile = "m8def.dat"
$crystal = 8000000
config Pinb.1 = Input
config LCD = 16*2
config 1wire = Portb.0

declare sub temp(rand As Byte)
declare sub zapis_id

Dim Temperatura(2) As byte
Dim Id(8) as Byte
Dim I as byte
Dim J as Byte
Dim k as byte
DIM UKL as byte

S1 alias Pinb.1
Deflcdchar 0,7,5,7,32,32,32,32,32

Set Portb.1
Cls



UKL = 1wirecount()
if S1 = 0 then
   Lcd "UKL" ; UKL
   if UKL > 0 then
      Id(1) = 1wsearchfirst()
      For I = 1 to 8
         writeeeprom Id(I) , I
      next I
   end if


   If UKL > 1 then
      Id(1) = 1wsearchnext()
      J = 0
      for I = 9 to 16
         incr J
         writeeeprom Id(J), I
      next I
   end if
   lowerline
   Lcd "Prog OK"
   do
   loop
end if


do
   home
   for K =1 to UKL
      call temp(K)
      if Temperatura(2) = 0 then
         Lcd "Temp" ; K ; " :" ; Temperatura(1) ; Chr(0) ; "C"
      else
         Lcd "Temp" ; K ; " : -" ; Temperatura(1) ; Chr(0) ; "C"
      end if
      lowerline
   next K
loop
end


Sub temp(rand as byte)
   if rand = 1 then
      for I = 1 to 8
         readeeprom Id(i) , I
      next I
   end if
   if rand = 2 then
      J = 0
      for I = 9 to 16
         Incr J
         readeeprom Id(J)
      next I
   end if

   1wreset
   call zapis_id
   1wwrite &H44
   waitms 750
   1wreset
   call zapis_id
   1wwrite &HBE
   Temperatura(1) = 1wread(2)
   1wreset
   if Err = 1 then
      cls
      LCD "Se rompio"

      do
      loop
   end if

   if temperatura(2) > 0 then
      Temperatura(1) = 256 - Temperatura(1)
   end if

   Temperatura(1) = Temperatura(1)/2
end sub

sub zapis_id
   1wwrite &H55
   for I = 1 to 8
      1wwrite Id(I)
   next I
end sub
