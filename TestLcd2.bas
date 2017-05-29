$regfile = "m8def.dat"
$crystal = 8000000

Config Lcd = 16*2
Config PORTC = Output
config PinB.0 = Input

Dim var as byte

Dim state as byte

var = 0
state = 0
set portb.0


Cls
lcd var


cursor off Noblink
do

   if pinb.0 = 0 and state =0 then
      state = 1


      do
         if pinb.0 = 1 and state = 1 then
            state = 0
         end if
      loop until state = 0

      cls
      incr var
      lcd var
      'waitms 100
   end if





loop

cls
end
