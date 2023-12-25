*xnor_gate*
.include PTM_45nm.txt

.PARAM supply=1.1
.PARAM Lmin=45nm
.PARAM Wmin=45nm
.PARAM Wp={2*Wmin}

vvdd vdd 0 supply
.global vdd gnd

.subckt inverter in out 
MP1 out in vdd vdd pmos w={Wmin} L={Lmin}
Mn1 out in 0 0 NMOS W={Wmin} L={Lmin}
.ends inverter

.subckt pass_transistor control in out
Xinv control not inverter
MP1 out not in vdd pmos w={Wp} L={Lmin}
MN1 out control in 0 nmos W={Wmin} L={Lmin}
.ends

.subckt xnor a b out
Xinva a a_ inverter
Xinvb b b_ inverter

Xpt1 b a out pass_transistor
Xpt2 b_ a_ out pass_transistor
.ends

Xn a b out xnor

**USE '*' for commenting

.PARAM trfin=10p
.PARAM t1 = 10n
.PARAM t2 = 20n
.PARAM t3 = 30n
.PARAM t4 = 40n
.PARAM t5 = 1*8000p+1200p
.PARAM t6 = 1*8000p+1210p
.PARAM t7 = 1*8000p+5200p
.PARAM t8 = 1*8000p+5210p
.tran 6p 50n

*Use below two lines for input 
V1 a 0 PWL (0 0 't1' 0 't2' 0 't2+trfin' 'supply' 't3' 'supply' 't4' 'supply')
V2 b 0 PWL (0 0 't1' 0 't1+trfin' 'supply' 't2' 'supply' 't3' 'supply' 't3+trfin' 0 't4' 0)

* Use below lines if you wish to change the input waveform, comment the above two V1 and V2 values when using below lines
*V1 a 0 PULSE (0 supply 0 0.1n 0.1n 4n 8n)
*V2 b 0 PULSE (0 supply 2n 0.1n 0.1n 4n 8n)

.control
run
*sets background color of plot, comment below line for black background
* set color0=white 
*plots input
plot v(a) v(b)
*plots output
plot v(out) 

.endc
.end
    