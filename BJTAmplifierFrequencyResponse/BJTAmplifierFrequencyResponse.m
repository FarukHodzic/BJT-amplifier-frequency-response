Rs=input('Please input value of source resistance:');
R1=input('Please input value of Resistor1:');
R2=input('Please input value of Resistor2:');
RC=input('Please input value of collector resistor:');
RE=input('Please input value of emitter resistor:');
RL=input('Please input value of load resistor:');
RE1= input('Does your circuit have a swamping resistor? If yes enter its value, if no enter 0:');
C1=input('Please input value of input capacitor:');
C2=input('Please input value of bypass capacitor:');
C3=input('Please input value of output capacitor:');
Bac=input('Please input value of Bac:');
VCC=input('Please input value of VCC:');
Cbe=input('Please input value of Cbe:');
Cbc=input('Please input value of Cbc:');

VB=R2/(R1+R2)*VCC;
VE=VB-0.7;
IE=VE/RE;
re=(25*10^-3)/IE

Rin=1/(1/R1+1/R2+1/(Bac*(re+RE1)));
fclinput=1/(2*pi*Rin*C1)

Rinemitter=re+RE1+(1/(1/R1+1/R2+1/Rs))/Bac;
fclbypass=1/(2*pi*((Rinemitter*RE)/(Rinemitter+RE))*C2)

Rout=RC+RL;;
fcloutput=1/(2*pi*Rout*C3)

Rintotal=1/(1/Rs+1/R1+1/R2+1/(Bac*(re+RE1)));
Rcl=(RC*RL)/(RC+RL);
Avmid=Rcl/(re+RE1);
Cinmiller=Cbc*(Avmid+1);
Cintotal=Cinmiller+Cbe;
fcuinput=1/(2*pi*Rintotal*Cintotal)

Coutmiller=Cbc*((Avmid+1)/Avmid);
fcuoutput=1/(2*pi*Rcl*Coutmiller)

A=[fclinput fcloutput fclbypass];
fcldom= max(A)
fcudom= min(fcuinput,fcuoutput)
Bandwidth=fcudom-fcldom


UnityGain=Avmid*Bandwidth





    