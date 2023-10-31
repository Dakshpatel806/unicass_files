v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 760 -600 760 -510 {
lab=#net1}
N 760 -510 860 -510 {
lab=#net1}
N 760 -680 760 -660 {
lab=#net2}
N 760 -680 860 -680 {
lab=#net2}
N 860 -680 860 -590 {
lab=#net2}
N 600 -710 600 -590 {
lab=Vref}
N 760 -400 760 -310 {
lab=#net3}
N 760 -310 860 -310 {
lab=#net3}
N 760 -480 760 -460 {
lab=#net4}
N 760 -480 860 -480 {
lab=#net4}
N 860 -480 860 -390 {
lab=#net4}
N 760 -170 760 -80 {
lab=#net5}
N 760 -80 860 -80 {
lab=#net5}
N 760 -250 760 -230 {
lab=#net6}
N 760 -250 860 -250 {
lab=#net6}
N 860 -250 860 -160 {
lab=#net6}
N 600 -530 600 -390 {
lab=#net7}
N 600 -330 600 -160 {
lab=#net8}
N 600 -200 720 -200 {
lab=#net8}
N 600 -430 720 -430 {
lab=#net7}
N 600 -630 720 -630 {
lab=Vref}
N 600 -100 600 -60 {
lab=GND}
N 800 -630 950 -630 {
lab=xxx}
N 800 -200 950 -200 {
lab=xxx}
N 950 -630 950 -200 {
lab=xxx}
N 800 -430 950 -430 {
lab=xxx}
N 950 -430 1070 -430 {
lab=xxx}
N 520 -710 600 -710 {
lab=Vref}
C {xschem_sky130/sky130_tests/passgate.sym} 760 -630 0 0 {name=x1 W_N=1 L_N=0.2 W_P=1 L_P=0.2 VCCBPIN=VCC VSSBPIN=VSS m=1}
C {res.sym} 600 -560 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 600 -360 0 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 600 -130 0 0 {name=R3
value=1k
footprint=1206
device=resistor
m=1}
C {xschem_sky130/sky130_stdcells/inv_1.sym} 860 -550 1 0 {name=x2 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {xschem_sky130/sky130_tests/passgate.sym} 760 -430 0 0 {name=x3 W_N=1 L_N=0.2 W_P=1 L_P=0.2 VCCBPIN=VCC VSSBPIN=VSS m=1}
C {xschem_sky130/sky130_stdcells/inv_1.sym} 860 -350 1 0 {name=x4 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {xschem_sky130/sky130_tests/passgate.sym} 760 -200 0 0 {name=x5 W_N=1 L_N=0.2 W_P=1 L_P=0.2 VCCBPIN=VCC VSSBPIN=VSS m=1}
C {xschem_sky130/sky130_stdcells/inv_1.sym} 860 -120 1 0 {name=x6 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {gnd.sym} 600 -60 0 0 {name=l1 lab=GND}
C {ipin.sym} 520 -710 0 0 {name=p1 lab=Vref}
C {opin.sym} 1070 -430 0 0 {name=p2 lab=out}
