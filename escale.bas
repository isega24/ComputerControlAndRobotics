$regFile = "m8def.dat"
$crystal = 8000000

Config Pinb.0 = Output

Config timer0 = Timer, prescale = 64

on Timer0 Odmierz_1s
Dim Licz_8ms As Byte

Enable Interrupts
Enable Timer0, 75

do
Loop
End

Odmierz_1s:
Load Timer0, 75
Incr Licz_8ms

if Licz_8ms = 250 then
   Licz_8ms = 0
   Toggle Portb.0
end if

return
