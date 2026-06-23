# The Great Educational-Computer Comparison Test — Part 1: Computers for Experimenting

*Hardware — LOAD #10 (2024), pp. 72–75. By Michael Wessel. English translation of the German original. Source PDF: https://www.classic-computing.de/wp-content/uploads/2024/10/load10web.pdf*

In the early 1980s a new home-computer category appeared on the already nearly
saturated German market: the educational and experimentation computer. We present
three representatives of this category in detail — the Philips MasterLab, the
Busch Microtronic, and the Kosmos CP1.

When, at the end of 1981, the first educational and experimentation computer for
"technically interested laypeople" [1] appeared in German department stores in the
form of the Busch 2090 Microtronic, 8-bit home computers were already widespread
in Germany. Worth mentioning in particular are the representatives of the
"Trinity" (Apple II, TRS-80, Commodore PET), but also the VC-20, Atari 400 and
800, Sharp MZ-80, Sinclair ZX80 and ZX81, and the Texas Instruments TI-99/4a.
There was thus no shortage of home computers in Germany — so why a new device
category called "educational and experimentation computer"? And what distinguishes
such a computer? What are the differences from classic CPU development systems or a
CPU trainer?

## Predecessors

Well-known representatives of the trainer category include the KIM-1 (1976,
6502-based, MOS Technology), but also the MK-14 (1978, Science of Cambridge, with
SC/MP / INS8060 CPU). In the USA the COSMAC ELF (RCA 1802 CPU) and the Heathkit
ET-3400 trainer (Motorola 6800 CPU) had been around since 1976. There were also
various self-build projects in the relevant computer magazines (*mc*, *c't* and
others). It can be assumed, though it is not documented, that these CPU trainers at
least inspired the development of the German educational computers. Jörg Vallen,
who from autumn 1979 was substantially involved in the development of the
Microtronic as part of his diploma thesis, sums up the need for a new computer
category in the preamble of his thesis [1] as follows:

> "At the time development of an experimentation and educational computer began, in
> autumn 1979, microcomputers of this kind were hardly to be found on the market.
> There were as yet no devices that enabled non-specialists to familiarize
> themselves with microprocessor technology. (…) Only so-called development systems
> were offered by the large semiconductor manufacturers, in order to give engineers
> with appropriate training the opportunity to learn the workings of a particular
> microprocessor type. Accordingly, these systems were designed from the electronic
> side. The manuals and descriptions written by specialists were (and largely still
> are today) incomprehensible to non-specialists without basic knowledge."

Later, Hans Vallen, then head of the Busch company and father of Jörg Vallen, used
the term "computer driving school" to characterize the Microtronic [2]. So what
defines an educational and experimentation computer? In the author's opinion, the
following points should be mentioned:

**Educational focus.** The target group is "interested laypeople", and children and
teenagers in particular. Accordingly, the manuals especially must be designed with a
certain didactic standard — many classic CPU trainers are inadequate in this
respect. Making matters worse, many CPU trainers were only available as kits. The
educational and training focus surely also convinced some parents that buying an
educational computer was the better choice compared with a BASIC home computer used
primarily for games, which would moreover compete for the family television set.

**Experimentation focus.** The primary field of application lies not only in learning
to program, but also in combining experiments with electronic circuits ("physical
computing"). Corresponding inputs and outputs (general-purpose input/output ports,
GPIOs) are therefore required. These GPIOs should also be designed to be robust
against miswiring, so as to largely enable "worry-free experimentation". Today one
would use an Arduino or similar for this — in contrast, the educational computers of
the 1980s were complete systems that needed no additional "PC" for programming.

**Cost.** The high cost of a "real" BASIC home computer at the start of the 1980s
certainly posed a high barrier to entry for the parents of computer-interested
children and teenagers. With the exception of the Sinclair ZX80/81, these still cost
around DM 700 and more, plus the cost of peripherals, software and books. The price
situation only changed drastically at the end of 1983, when the home-computer market
saturation finally led to the price collapse of 1984 — Texas Instruments, for
example, had discontinued production of the TI-99/4a at the end of 1983, owing to the
price war for market share with Commodore. The first advertisement for the Busch
Microtronic known to the author appeared in 1981 in the November/December issue of
the magazine *mc* [3] — a price of DM 379 was given there, falling over time to
DM 299 (1984). By comparison: a VC-20 still cost DM 798 at the end of 1981. The
average income in Germany in 1981 was DM 30,900 per year — so a VC-20 cost a full
week's salary!

**Availability and procurement.** The CPU trainers in particular were hard for
ordinary consumers and technically interested laypeople to obtain, since they were
often offered only as kits and known only to readers of electronics and amateur-radio
magazines. Department stores did not carry such computers and they were therefore off
the radar for ordinary consumers. Acquiring — or possibly even building — a CPU
trainer therefore required special sources of supply, or even expertise and
appropriate tools, which were simply unknown and unavailable to the layperson and
beginner. In this respect, Mr. Vallen's assessment is to be agreed with.

After these attempts at definition and characterization, this article and its
continuation in the next LOAD will present three educational and experimentation
computers. We begin with the MasterLab MC 6400 from Philips, from 1983. In the next
LOAD we then take a detailed look at the Kosmos CP1 system and the Busch Microtronic.

---

## Philips MasterLab MC 6400

Philips was at the time probably the second-largest supplier of experimentation kits
on the German market, behind the market leader Kosmos. In 1983 the MasterLab computer
initially came out under the Philips label — for DM 449.00, as part of the new "6000"
(a.k.a. "ABC") series. From 1984 Philips then withdrew, at least from the
experimentation-kit market, and the 6000-series kits were continued under the Schuco
name. The takeover by the Mangold Group — consisting of the companies Schuco, Trix
and "Georg Adam Mangold" (GAMA) — had already been decided in 1982. The 6000 kits,
and thus the MasterLab, had previously been developed by the Philips educational-
materials department together with the "Institut für Lehrerfortbildung" (Institute for
Teacher Training) in Hamburg. Worth mentioning in particular here is Mr. Erhard Meyer,
author of the MasterLab manual. As the firmware EPROM reveals, the initials "E.M." are
also found there: "COPYRIGHT 1982,1983 (C) GAMA, E.M., H.C.R.C.V9.8 1/15/83". Might
Mr. Meyer perhaps also have created the MasterLab firmware? The only thing that seems
certain is that the MasterLab's birthplace really does lie in Hamburg. More details on
the MasterLab's origin story can be found on the excellent site [4].

### External attributes

The MasterLab is a feast for the eyes — the shapely silver case with its transparent
Plexiglas hood looks professional, and the colorful keys make you curious to
experiment. Moreover, the seven-segment LED display offers eight digits instead of
just six! A row of eight LEDs below the display, and three further LEDs F1, F2, F3
with two additional input buttons SA and SB, are found on the control panel. By means
of the SSA/LED switch, the display can be toggled between the seven-segment display
and the eight LEDs — the eight individual LEDs are driven by the (7 + 1 decimal-point)
digit segments of the middle digit. The MasterLab also has an on/off switch —
actually a matter of course, but neither the Microtronic nor the Kosmos CP1 is blessed
with one. A reset button is likewise present. In addition there are eight function keys
to control the monitor.

### An unusual CPU

The shapely board is equipped with an INS8070 (SC/MP III) CPU, clocked at 4 MHz. As in
the Busch Microtronic (which we will present in the next LOAD), the 2114 SRAM — here in
a doubled arrangement for 8 bits — provides 1 KB in the address range 0x1000 to 0x13FF.
The firmware fits in a 4 KB (2732) EPROM in the address range up to 0x0FFF. Unlike the
Busch Microtronic and the Kosmos CP1, which are programmed in a virtual, firmware-
interpreted higher-level machine language, the MasterLab is programmed directly in
INS8070 machine language — it is therefore more of a classic CPU trainer than an
"educational computer". The machine is consequently also considerably faster than the
Microtronic and the CP1 — in an experiment the author measured a processing speed of
147,050 instructions per second [5]. This makes the MasterLab almost 1300 times faster
than the Microtronic and almost 80 times faster than the CP1.

On power-up, the MasterLab monitor program announces itself with a friendly "HALLO" on
the display — making clear right at switch-on that the seven-segment display is good for
more than just hex numbers. In fact, every segment of every digit can be addressed
individually, as the scrolling-text demo program in ROM also demonstrates.

### Button-controlled GPIOs

The buttons SA, SB and the LEDs F1, F2, F3 constitute the MasterLab's input/output
ports (GPIOs). These are also brought out as a header strip for electronics experiments
— the inputs/outputs are each buffered/protected with transistors. The MasterLab thus
offers only three digital outputs and two digital inputs. That can be called somewhat
meager. The way these GPIOs are connected is interesting — they are controlled directly
by the flag/status register of the INS8070! By setting or reading the corresponding
bits in the status register, the GPIOs can be accessed directly from the CPU. No support
from firmware routines is needed for this. The SA, SB flags can also trigger interrupts.
These GPIOs thus work yet again about two orders of magnitude faster than on the CP1.
Unlike the Microtronic and CP1, the MasterLab comes with a cassette interface as
standard — and interestingly, this is realized almost entirely in software. Thanks to
the fast inputs/outputs, not only can the 1 and 2 kHz audio signals for cassette storage
be generated directly by the CPU, but these signals are also read back into the CPU via
the SB input. The pulses from the cassette recorder can be observed directly in the
status register and are analyzed there by the load routine. On the left side of the
board there is also an expansion bus — the address, data and control buses are all
brought out here. A RAM expansion should therefore be easy to realize. Expansion boards
(for example for more GPIO) were apparently envisioned for the MasterLab, but never
released.

### Firmware and demos

The firmware contains several built-in demo programs: siren, lottery numbers,
calculator, scrolling-text display, digital clock, traffic-light control with the three
F-LEDs, dice, and so on. The SP ("Spiele" / games) key is used to start a built-in
program. The monitor program holds no particular surprises and works similarly to
comparable CPU trainers (for example the Multitech MPF-1 Microprofessor): A/D toggles
between address and data entry; ME+ and ME- are used to increment and decrement the
address. The keys SV and LD control the cassette operations. The CPU key allows
inspection of all CPU registers — thus "CPU 6" shows the accumulator and "CPU 0" the
program counter (PC). Registers can also be modified. The RUN key normally starts a
program at address 0x1000. To start a program from a different address, the PC must
first be set: "CPU 0" followed by a four-digit hex address and CPU sets the PC. The
program can then be started from that address via RUN-RUN. Breakpoints and single-step
execution are unfortunately not provided; as with the CP1, however, a halt instruction
can be inserted into the code (manually).

### Manual

The manual offers a deep and comprehensive introduction to INS8070 programming — the
instruction set of this interesting CPU is explained almost completely. The CPU even
offers some 16-bit operations — for example, the multiply instruction can multiply two
16-bit numbers. Here the two 8-bit registers A and E are combined into a 16-bit
register, which is then multiplied by the 16-bit T register. The 32-bit-wide result is
then likewise held in the combined A, E, T registers. A divide instruction exists too.
The INS8070 even offers a stack pointer, as well as two further pointer registers (SP1,
SP2) used for indexed addressing. The INS8070 additionally supports interrupts, and
there is a wealth of addressing modes — everything the heart desires is here
(immediate, absolute, implied, direct, indirect, indexed, relative, etc.). The INS8070
is a fascinating but also quite complex CPU.

As in comparable systems (for example the Multitech MPF-1 Microprofessor), the firmware
provides a number of routines that make programming easier — or, given the limited
memory, make more complex programs possible in the first place — reachable via CALLs.
These include routines for controlling the display, for two- and four-digit input via
the hex keypad, routines for conversion between decimal and hexadecimal, and so on.

### What you can do with it

The biggest shortcoming of the MasterLab is probably its limited experimentation
capability. The manual only demonstrates connecting the loudspeaker, an incandescent
lamp (the outputs are, after all, transistor-buffered), and building a simple light
barrier with a photoresistor. More GPIOs would certainly have been useful here to enable
more complex controls and experiments. That said, the direct coupling of the GPIOs to
the CPU hardware, which needs no further involvement of the firmware, must be called
brilliant — a very efficient design. The MasterLab's strengths are therefore more those
of a classic CPU trainer than of an "experimentation computer".

The learning material, too, is much more complex, comprehensive and technical than in
the other systems. For laypeople the learning curve is consequently considerably
steeper, and its suitability for children and teenagers is therefore to be rated lower.
Here the target was apparently adults — or customers from teacher training. However,
the MasterLab is the only system that offers a complete, realistic and practical
approach to microprocessor programming. None of the other educational computers
discussed in this article series is able to convey the material in this depth and
breadth. The reader looks in vain, however, for lightening or humorous illustrations in
the manual — the material is presented bone-dry and technical. The author is not aware
of any current community projects, emulators or re-implementations of the MasterLab.

### Conclusion

Of the educational computers presented in our article series, the MasterLab is the only
"real" CPU trainer; it convinces with solid build quality, a full expansion port, very
high processing speed, extremely fast (if strongly limited in number) GPIOs, interrupts,
and the very powerful INS8070 CPU. It also offers full control over every individual
segment of the eight-digit display and allows the generation of tones in software by
bit-banging. Unlike the Kosmos CP1 (which we present in the next LOAD), the keyboard can
be used by programs at runtime. Critically, it must be noted that the MasterLab is
primarily a classic CPU trainer.

At its release date (1983/84), however, it appeared too late on the market. It is
suitable primarily for adults with prior training and offers a very interesting and
powerful CPU — which had, however, become completely irrelevant by 1984. A Z80-based
Multitech MPF-1 Microprofessor would have been available to this target group at a
similar price point as early as 1981. The MPF-1's manuals are admittedly another notch
worse didactically than the MasterLab's. For this target group, however, that plays a
subordinate role. The Z80 was a relevant CPU in the 1980s, unlike the INS8070. In this
respect the MasterLab must unfortunately also be described as the system that was
developed too late, too expensively by comparison, and past its target group.

German educational computers are a fascinating and magnificent piece of technical
history that did not exist in this form in other countries. Anyone interested in the
two other representatives of this genre will have to wait for the next LOAD: further
overview and test articles can be found in the author's GitHub repo [4], and some videos
on programming and performance on YouTube [5].

---

### Sidebar — From the wealth of experiments / technical highlights

**Over 150 programming experiments**, including: music programs · running light ·
electronic calculator · reaction tester · light-barrier counter · digital clock ·
experiments with external peripherals · logic operations · jump instructions ·
mathematical programs · shift and rotation operations · subroutines, etc.

**From the extensive feature set / special technical achievements:** integrated cassette
electronics · microprocessor (CPU) with 38,000 transistor functions · 12 built-in
programs already stored · 9 highly integrated circuits · 8-digit LED display · 11 LEDs ·
27 input and function keys · 1024 × 8 bits of free memory · 4096 bytes of fixed memory ·
enclosed memory cassette as a program library with pre-recorded programs · transfer
cable for cassette recorder · plug-in power supply.

*(Description of the MasterLab from the Philips catalogue 1983/84.)*

### Links

1. Jörg Vallen, diploma-thesis preamble — https://github.com/lambdamikel/Busch-2090/blob/master/manuals/joerg-vallen-diplom.pdf
2. *Spielmittel* 4 (1984), 16, pp. 58–60 — https://github.com/lambdamikel/Busch-2090/blob/master/manuals/spielmittel-article1.jpg
3. *mc — Die Mikrocomputer-Zeitschrift*, Nov/Dec 1981, p. 78 — https://hschuetz.selfhost.eu/mc-zeitschriften/1981/mc-1981-04.pdf
4. Interesting information on the MasterLab — http://norbert.old.no/kits/6400/6400.html
5. Michael Wessel's YouTube channel on educational/experimentation computers — https://www.youtube.com/playlist?list=PLvdXKcHrGqhe_Snxh4nh8RMDz2SiUDCHH

### About the author

Dr. Michael Wessel is a computer scientist and has worked in Silicon Valley, California,
since 2010. He owes his professional career to the Busch Microtronic, which he received
from his parents for Christmas in 1983. He has collected home computers since 2001 and is
known in the scene as *LambdaMikel* and *MicrotronicHamburg*.
