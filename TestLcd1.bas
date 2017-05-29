$regfile = "m8def.dat"
$crystal = 8000000

Config Pinc.0=Input
Config PINB.0 = Output
Config Lcd = 16*2


dim licznik As byte

Set Portc.0


Do
   If Pinc.0=0 Then
      Set portb.0

   else
      Reset Portb.0
      licznik= licznik+1
      lcd licznik
   End if


loop
end
