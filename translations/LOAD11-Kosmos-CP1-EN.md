# Educational Computers from Stuttgart — The Kosmos CP1

*Hardware — LOAD #11 (2025), pp. 72–75. By Michael Wessel. English translation of the German original. Source PDF: https://www.classic-computing.de/wp-content/uploads/2025/10/load11web.pdf*

In the early 1980s a new home-computer category appeared on the already nearly
saturated German market: the educational and experimentation computer. LOAD #10
already presented the Philips MasterLab; this article is now devoted to the
Kosmos CP1.

The Kosmos CP1 was released in 1983 at an introductory price of DM 198. The CP1
was conceived as a complement to Kosmos electronics kits, for example the
"Elektronik Labor" sets. By means of a plastic cross-connector rail, an
already-owned Kosmos experimentation breadboard with the Kosmos-typical clamp
contacts can be attached to the CP1. Matching cables for the screw terminals
brought out at the back of the CP1 can be screwed directly to it. The CP1's
appearance can be called modern — the membrane keyboard and the very nice, large
six-digit seven-segment LED display immediately catch the eye. It also becomes
clear at first glance that exclusively the decimal number system is used here,
since the hexadecimal digits A through F are nowhere to be found. In addition,
the digit keys are duplicated. The case is shapely and the keyboard solid, but
the build quality of the case does not convince: the plastic is quite thin, as a
light press on the ventilation slots reveals. Moreover, the bottom of the case is
made of thick cardboard, fastened with almost microscopically small screws. These
days CP1s also have a strong smell, because the circuit boards were not washed
after production and plenty of flux was used.

The membrane keyboard is of good quality, but does not allow "blind" typing — you
always have to look at your fingers. That requires attention and distracts from
programming, because there is also no haptic pressure point or "frame" for the
membrane keys. In addition, the duplicated digit keys are, in the author's
opinion, a pure waste of space — the space could have been used better otherwise,
for example for an EAZ key (see below) or indeed for hexadecimal keys. The
position of the CAL key is also unfortunate, since accidental activations occur
frequently due to its proximity to the INP key.

## Processor

The heart of the CP1 is a mask-programmed Intel 8049, accompanied by an 8155
serving as 2 KByte 8-bit SRAM and for I/O. But there also exist CP1 units that
use the non-mask-programmed Intel 8749 with an additional external EPROM for the
firmware instead of the 8049 [8]. These may be early versions of the CP1, but
other reasons for this hardware variant are also conceivable — for example
availability problems with the 8049, high costs, or production bottlenecks. The
8049 is clocked at 6 MHz.

The development history of the CP1 is unknown to the author of this article; the
foreword of the manual, however, was written by Prof. Karl Steinbuch, a prominent
professor of information processing at the University of Karlsruhe. To what extent
Professor Steinbuch influenced the design of the CP1 is likewise not documented.

The CP1 is not programmed in the machine language of the microcontroller used (in
this case MCS-48), but in a virtual machine language that is then executed by an
interpreter. The 2 KB CP1 firmware contains, besides the interpreter, the monitor
program and a few built-in programs.

## Architecture

The architecture of the CP1 is laid out as a strict, almost academic decimal von
Neumann machine. The only register present is an accumulator (Akku). All
logical-arithmetic and data-transfer operations to and from memory must pass
through this "von Neumann bottleneck". In the base version the CP1 offers 128
memory cells, which serve both as program and as data memory. By means of the CP3
memory expansion, the CP1 can be expanded to a total of 256 cells. All data,
instructions and addresses are encoded in decimal.

The CP1 is predominantly an 8-bit architecture, because all arithmetic-logical
operations work with an 8-bit range and addresses are also 8 bits wide.
"Predominantly" means here that the cells can hold values from "00.000" to
"24.255". As a result, the internal representation requires at least 13 bits, and
probably simply uses two full bytes of the 8155 SRAM to implement one CP1 cell.
For a cell content of the form "xy.abc", "xy" denotes the instruction code (which
runs from 01. to 24.), and "abc" the operand, which can be a datum or an address
from 0 to 255. For data, by contrast, "00.abc" is used.

On power-up, the monitor program greets you with "P .000" — "P" indicates the
program counter (PC). With "9 RUN" only a first self-test program can be tried
out; the display then shows, in rapid succession, the numbers "999999",
"888888", down to "000000". It is interesting to note that it is *not* possible
to write such a program with the CP1 itself: the instruction set does not allow
corresponding control over the display. In addition, a reaction-test game can be
invoked via "8 RUN".

For entering and inspecting programs, a further address register is used: the
decimal 8-bit input/output pointer (EAZ). It is independent of the PC and can,
for example, inspect arbitrary memory locations during single-step execution
without affecting the PC and thus program execution. The EAZ is not permanently
displayed — instead, the key sequence "9 OUT" must be used to show it. The EAZ is
set by entering the desired address (three digits, decimal) followed by "OUT",
whereupon the cell content at that address is shown — for example "C00.000". Here
"C" stands for "(Memory) Cell"; as explained above, "00." denotes data, while
"04.123", for example, means the instruction "load constant 123 into the
accumulator (AKO 123)". By pressing "OUT" repeatedly, successive cells can be
inspected. The content of the cell at the current EAZ address is set simply by
entering the five-digit number followed by "IN" — "IN" is therefore the
Enter/Return key. Here too the EAZ is auto-incremented, so successive instructions
can be entered one after another. With CLR, input errors can be corrected. There
is no breakpoint functionality; instead, instructions must be replaced manually by
the HALT instruction and reconstructed manually afterwards. Using "9 OUT" to
display the EAZ is quite cumbersome and distracts from programming — here the use
of the hexadecimal system would have brought ergonomic advantages, since the six
display digits would suffice to show both the EAZ and the cell content (in hex).

Once the program has been entered, entering the three-digit start address followed
by PC first sets the PC. RUN or STEP then starts the program from there in normal
or single-step mode for debugging. The PC and ACC keys show the corresponding
register contents; these are indispensable for debugging, especially in
single-step mode. The STP (Stop) key interrupts a running program. As with the
Microtronic, there is a cassette interface (CP2) as an extension; for it, the keys
CAS and CAL are used for saving and loading.

## The instruction set

The CP1's instruction set comprises instructions for displaying the accumulator,
for display delay, for loading the accumulator with a constant and from a memory
location. The accumulator can also be loaded from a cell and stored back again. A
cell content can additionally be added to or subtracted from the accumulator.
There is an "implicit" flag register; it can be set by comparing the accumulator
with a specified cell, depending on whether the latter is equal to, less than, or
greater than the accumulator. A conditional jump is then executed if the flag is
set. Of course there is also an unconditional jump. A binary (0,1) accumulator
value can be logically negated and AND-combined with a binary cell content.
Bitwise logical operations, by contrast, do not exist.

The accumulator can be loaded with the cell content "xy.abc" from an arbitrary
address. In this case not only the datum "abc" is loaded, but also the operation
code "xy.". If it is in fact a datum or an address (i.e. "xy." == 00), then
logical-arithmetic operations can be performed with the accumulator (for example
addition or subtraction). If, however, it is an instruction, the accumulator can
only be written to an arbitrary address in memory or shown on the display. If a
logical-arithmetic operation is performed with an instruction in the accumulator,
this leads to program abort with the "F 002" error.

## Strengths and weaknesses

One strength of the CP1 is the very interesting instructions for indirect loading
and storing of the accumulator — they work analogously to pointer variables in
the C programming language. Complex data structures such as lists, stacks or
arrays can be implemented this way. The CP1 likewise offers indirect jumps — so a
return stack for recursion or arbitrarily nested subroutine calls can be realized.
Here one does not jump directly to a specified target address; instead, a cell is
specified that contains the target address as a datum. Target addresses can thus
also be modified or computed by the program.

In this way even self-modifying programs are possible, as well as programs that
can relocate other programs in memory ("relocation"). A corresponding relocation
program is given in the manual. Interestingly, it works only in a limited way:
because of the CP1's indirect addressing and jumping, program relocation is a
non-computable (undecidable) problem, and therefore the relocation program only
works for restricted CP1 programs.

Despite these fascinating possibilities, other instructions are painfully missed.
The input/output capabilities are severely limited; the display, for instance, can
only show the accumulator, which is generally a number from 0 to 255. Only in
exceptional cases is displaying an instruction code meaningful. The clock program
from the manual loads instruction codes into the accumulator in order to display
the hours "before the decimal point": data begin with "00.", instructions run
from "01." to "24.", so the program unceremoniously abuses these as the hours
display. Full control over the display is therefore not possible. More serious,
however, is that the keyboard cannot be used for input within programs. Instead,
the GPIOs and the supplied metal-bracket contacts serve as external input buttons.
Convenient, memory-saving instructions for multiplication, division,
random-number generation or bitwise logic are likewise missing.

A strength of the CP1, by contrast, is the large number of GPIOs. In the base
version it already has an 8-bit input/output plus an additional 8-bit output. With
the CP3 expansion, a second 8-bit input/output is added as well as two further
pure outputs of 8 and 6 bits. With these, extremely demanding control tasks can be
realized.

In all operations with the accumulator, care must be taken that it neither
overflows nor underflows. A value greater than 255 or less than 0 leads to program
abort with the error "F 006". A carry flag does not exist either — so how can
results greater than 255 or less than 0 be achieved? Here the use of the decimal
system turns out to be a stroke of genius: by means of "greater than 99"
comparisons and conditional jumps, several cells can be combined into
arbitrarily wide registers, because twice 99 is still less than 255. This trick
would of course also work with the hexadecimal system.

The instruction set is unfortunately not very terse, and CP1 programs are not very
concise. The strict von Neumann architecture means that for almost every operation
a datum must first be loaded from memory into the accumulator, then manipulated
there, and finally written back. This often triples the number of instructions
needed, so memory quickly runs short — aggravated by the low complexity of the
instructions (higher-level instructions such as multiplication or division do not
exist). The CP1 therefore illustrates the "von Neumann bottleneck" problem
excellently; unfortunately the manual does not address this.

The CP1 is considerably faster than the Busch Microtronic — the execution speed of
the CP1 machine-code interpreter was measured at about 3200 instructions per
second [3]. The high 6 MHz clock and the 8-bit architecture make the CP1 almost 30
times faster than the Microtronic. This is especially important for programs that
need high data rates at the GPIOs — here the CP1 is much more responsive.

## Manual

The manual is lovingly and didactically high-quality — whereas Busch uses the
"Buschi" mascot for humorous illustration, here the "Computron" is enlisted to
carry out the individual CPU operations [1]. The manual explains every instruction
type and discusses their use in increasingly complex programs. The programs are of
a similar kind as on the Microtronic — games (NIM, moon landing, dice, Senso,
number guessing and others), as well as programs in connection with the Kosmos
electronics kits (timers, reaction testers, blinking lights, tone generators,
alarm systems, model-railway control).

Compared to the Microtronic, some programs are designed less generally, probably
owed to the CP1's limited arithmetic and I/O capabilities. For instance, the NIM
game on the Microtronic is playable with arbitrary parameters (starting count and
maximum sticks to remove), entered via the keyboard at program start; the
Microtronic program then computes the NIM winning numbers and plays with optimal
strategy. By comparison, on the CP1 the winning numbers and thus the strategy are
hard-coded in memory, and it only works for 15 sticks with 3 removable. For lack
of keyboard input, external "metal-bracket buttons" for 1, 2, or 3 sticks are used
for input. Here it becomes clear that the CP1 architecture sometimes leads to
compromises and not very general solutions.

## Extensions

Unlike the Microtronic, the CP1 has a dedicated expansion bus. The CP2 cassette
interface and the CP3 memory/port expansion were already mentioned. In addition
there is the CP4 relay module, used in particular for model-railway control and
Fischertechnik robots. There is also the CP5: eight LEDs with transistor
amplifiers for output 2, paired with eight slide switches for input 1, which
greatly simplifies experiments with the ports. All CP extensions can be used
together, whereby the CP1 grows to a considerable and impressive depth.

Both software and hardware emulations (Arduino-based) and even re-implementations
of the CP1 are available. Since the firmware exists and the required components are
standard parts, almost faithful re-implementations can be realized easily, in
contrast to the Microtronic [8]. Software emulations also partly use the original
firmware: "MiniPC" [5] emulates the 8049 and then simply runs the CP1 firmware.
Other emulators take a more pragmatic approach and implement the emulated software
CPU's instructions directly in Java, without an 8049 emulator [6]. Among
Arduino-based hardware emulations, the versions by "Matze" and "JJ Flash" are
particularly noteworthy [9, 10]. An Arduino-based CP2 emulator for loading and
saving programs has also been developed [7]. Further information about the CP1 can
be found on the interesting website [2].

## Conclusion

All the educational and experimentation computers presented have their strengths
and weaknesses — no system completely subsumes the others in its educational
offering, and no system is perfect.

From the CP1 one can learn about indirect addressing and indirect jumps, about the
advantages and disadvantages of the von Neumann architecture, and how (indirect)
memory addressing is used to implement complex data structures. Because of its
large number of fast GPIOs, the CP1 is the clear winner for measurement and
control tasks, and thus the clear winner in the "experimentation computer"
category.

But the CP1 must unfortunately also be called the system of squandered potential.
With a few additional instructions (after all, even in decimal notation the
instruction codes from 25. to 99. would still be available), the CP1 could have
been considerably more universally usable. Instructions for keyboard input,
display control, multiplication and division, random numbers, bitwise logic, and
support for the hexadecimal system would have worked true wonders here. However,
there was probably no more room in the 2 KB mask-programmed ROM, as a look into the
"CP1.BIN" firmware file reveals. It is regrettable that Kosmos did not choose an
8050 with 4 KB ROM.

The Microtronic, with its almost completely orthogonally usable registers, has
almost RISC-like qualities, and its easy-to-learn, terse and powerful instruction
set allows more complex application programs in the limited memory. Its manuals are
ideal for children and young people. The Microtronic can therefore be called the
clear winner in the "educational computer" category. Although it offers no memory
addressing for data storage, restricted recursive programs can nevertheless be
implemented, as on the CP1 [4]! Compared to the CP1, the Microtronic suffers from
low operating speed [3]. For an educational and experimentation computer this is
only conditionally limiting — as long as no fast GPIOs are needed for experiments.
In conclusion, the German educational computers represent a fascinating and
magnificent piece of technical history that did not exist in this form in other
countries. (mw)

### Comparison between Busch Microtronic, Kosmos CP1 and Philips MasterLab (see LOAD #10)

*(Higher = better.)*

| Criterion | Microtronic | CP1 | MasterLab |
|---|:--:|:--:|:--:|
| Period authenticity | 3 | 2 | 1 |
| Difficulty / suitability for children & teens | 3 | 2 | 1 |
| Monitor program | 3 | 2 | 2 |
| Ergonomics | 2 | 1 | 2 |
| Quality of manuals | 3 | 2 | 2 |
| Speed | 1 | 2 | 3 |
| Number of GPIOs | 2 | 3 | 3 |
| GPIO speed | 1 | 2 | 3 |
| Memory | 2 | 2 | 3 |
| Software | 3 | 2 | 1 |
| Experiments | 3 | 3 | 1 |
| Expandability | 1 | 2 | 3 |
| Expansion modules | 2 | 3 | 1 |
| Popularity / number of fans | 2 | 3 | 1 |
| Modern extensions | 3 | 2 | 1 |
| I/O capabilities | 2 | 1 | 3 |
| Addressing modes | 1 | 2 | 3 |
| Conciseness of CPU model | 3 | 1 | 2 |
| Capabilities of CPU model | 2 | 1 | 3 |
| **TOTAL (equally weighted)** | **42** | **38** | **37** |

### Links

1. Kosmos CP1 manual — https://archive.org/details/cp-1-manual
2. General info on the CP1 — http://www.8bit-homecomputermuseum.at/computer/kosmos_computer_praxis_cp1.html
3. YouTube channel Michael Wessel — https://www.youtube.com/playlist?list=PLvdXKcHrGqhe_Snxh4nh8RMDz2SiUDCHH
4. "Towers of Hanoi" on the CP1 and Microtronic — https://github.com/lambdamikel/towers-of-hanoi
5. "MiniPC" CP1 emulator by Georg Heinrichs — https://www.g-heinrichs.de/wordpress/index.php/informatik/minipc/
6. Java-based Kosmos CP1 emulator — https://sourceforge.net/projects/cp1-sim/
7. Arduino-based Kosmos CP2 emulator — https://github.com/asig/kosmos_tape_emulator
8. mac8-bit CP1 reproduction — forum.classic-computing.de (thread 22241, "CPU 8049 Platinencomputer")
9. CP1 reproduction by "Matze" — https://www.rigert.com/ee-forum/viewtopic.php?f=35&t=2115
10. CP1 reproduction by "JJ Flash" — https://www.youtube.com/watch?v=RQkwm0jpxF0

### Correction to "The great comparison test of educational computers — Part 1" (LOAD #10, 2024)

In the article on the Philips MasterLab, the typo gremlin struck on p. 75: the last
sentence should read "Further information about the MasterLab can be found in [4],
and …". The author of the article is not the author of website [4]. In addition,
there is a highly interesting piece of news about the MasterLab — since November
2024 there is an emulator! It was developed entirely in JavaScript + HTML/CSS by
Thorsten Brehm ("MacFly", from the classic-computing.de forum) and can also be
tried out online:
https://github.com/ThorstenBr/MasterLab-MC6400 · https://thorstenbr.github.io/MasterLab-MC6400
