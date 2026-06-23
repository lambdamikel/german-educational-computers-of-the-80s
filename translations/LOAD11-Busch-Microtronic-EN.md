# The Busch Microtronic Educational Computer — Astonishingly Vital

*Hardware — LOAD #11 (2025), pp. 76–79. By Michael Wessel. English translation of the German original. Source PDF: https://www.classic-computing.de/wp-content/uploads/2025/10/load11web.pdf*

Busch electronics kits had been available in Germany since 1976; until October 1981
they were distributed under the name "ELOtronic" by the Franzis publishing house. The
Microtronic was conceived as the complement and flagship of the Busch electronics-kit
series.

To what extent the *ELO* magazine influenced the design of the kits is unknown. The
Microtronic's appearance can be called elegant and high-quality — the case and the
build make a sturdy impression, and the smoked-glass cover looks professional. The
keyboard is of good quality and allows even longer program entry without frustration. It
is in no way inferior to the typical Texas Instruments calculator keyboards of the era,
such as the TI-30 or TI-58/59.

The heart of the Microtronic is a mask-programmed TMS1600 4-bit microcontroller, clocked
at 500 kHz. The firmware contains the operating system and an interpreter for a virtual
machine language. The Microtronic is therefore programmed not in TMS1600 machine
language, but in this higher-level Microtronic machine language. This is on the one hand
easier to learn, and on the other hand contains very powerful instructions, for example
for multiplication and division.

## Development

As can be read in Jörg Vallen's diploma thesis (he is the son of the then head of the
Busch company, Hans Vallen), development work on the Microtronic began in autumn 1979
[1]. The hardware and the operating system were carried out, to Busch's specifications,
by the company "MRT – Mess- und Regeltechnik" in Kaisersbach, which is now insolvent.
Jörg Vallen worked directly at MRT as part of his thesis and made essential development
contributions. Texas Instruments (TI) in Freising took over production of the
mask-programmed TMS1600 microcontroller. The instruction set, originally 20 instructions,
was then expanded to 41 instructions in the second development phase. Jörg Vallen was
again instrumental in these extensions: as the first programmer / application developer,
following the motto "eat your own dog food!", he identified deficits and further
desirable instructions. These included instructions for generating random numbers, and
for multiplication and division. The thesis also reveals that originally a TMS1xxx
development system was used (possibly an HE-2) with EPROMs, and that the finished
operating system was then handed over to TI "on a floppy disk".

As program memory, the developers connected a 2114 SRAM chip via the TMS1600 "GPIO port"
[11][12]. Actually, the TMS microcontroller family provides for no external memory at all
— neither ROM nor RAM. It is, after all, a "computer on a chip" meant to need no
additional components. The 1 KByte of 4-bit words of the 2114 is used for the Microtronic
program memory; the SRAM on the TMS1600, by contrast, is occupied by the 32 4-bit
Microtronic registers and further monitor variables.

## Harvard architecture

The Microtronic is a Harvard architecture — the program memory comprises 256 addresses
(0x00 to 0xFF), and each instruction consists of three nibbles (12 bits). Program and
data memory are strictly separated: as program-writable data memory, the Microtronic
offers exclusively the registers mentioned; there are, however, also instructions that
load registers with constants ("immediate addressing"). Of the 32 registers, 16 are
organized as working registers and the rest as background registers. Working and
background registers can be swapped with one another in banks of 8 registers each, so
that a data transfer between foreground and background registers can take place. All
logical-arithmetic operations and data must therefore fit into these 32 4-bit registers.

As the Microtronic's keyboard already suggests, the hexadecimal number system is used.
The hex keypad also offers eight function keys. The display is a six-digit seven-segment
LED display ("bubble LEDs", as in the old TI calculators). Two LEDs for the carry and
zero flags are also found on the control panel. On the Microtronic board there is also a
green reset key — the program memory survives a reset. A DIL expansion socket is used to
connect the "2095" cassette interface. In addition, four digital outputs, four digital
inputs, and a 1 Hz clock signal for clock experiments and the typical Busch electronics
kits are brought out as plug sockets.

## Built-in programs

On power-up, the Microtronic greets you with its monitor program: the display shows
"00 000". Here the address is on the left and the instruction at that address on the
right (both in hexadecimal). The monitor address can be set via HALT-NEXT. After entering
an instruction, NEXT then automatically advances to the next address, so that even longer
programs can be entered easily. RUN starts the program at the current monitor address,
and the monitor also offers single-step execution (STEP) and breakpoints (BRK). Register
contents can be inspected — and also changed — via REG. PGM serves to call built-in
programs. These include programs for loading from and saving to cassette (PGM 1 and
PGM 2), but also the NIM game (PGM 7), a program to clear the program memory (PGM 5), a
self-test program (PGM 0), and programs to display and set the (unfortunately not
battery-backed) real-time clock (PGM 3 and PGM 4). PGM 6 fills memory with NOPs.

## Instruction set

The Microtronic's instruction set is terse and pragmatic and must be called extremely
well-designed [2]. It includes, among other things, instructions to control the LED
display, which can show up to six consecutive registers or be switched off. Other
instructions serve keyboard input, GPIO, random numbers, time-of-day queries,
logical-arithmetic and bitwise operations, and functions for converting between
hexadecimal and decimal numbers. Most operations can, with few exceptions, be performed
equally in all registers — the instruction set is very orthogonal, similar to modern RISC
CPUs. The carry flag is used to combine arbitrary 4-bit registers into larger registers —
addition and subtraction can thus be carried out with up to 64 bits. Division, by
contrast, is limited to four and multiplication to six digits. The carry and zero flags
are set, among other things, by compare operations. Set flags can then trigger
conditional jumps. Subroutines are also possible (CALL and RET), but no nested CALLs — it
is therefore not possible to call a subroutine from within a subroutine.

The biggest shortcoming of the instruction set is probably that only two addressing modes
are supported. Operands can often be given immediately, i.e. as constants in the
instruction word ("immediate"), or else register-direct (the instruction specifies
register `<x>`). An example instruction that contains both addressing modes is "ADDI" —
"add constant `<n>` to register `<x>`": `5<n><x>`. Thus, for example, 510 means "add 1 to
register 0". For jumps there are neither immediate nor indirect target addresses; these
are always given immediately in the instruction word and cannot therefore be loaded into
a register and hence cannot be computed. For this reason, indirect and computed jumps —
and thus also recursive algorithms — can only be implemented through relatively
complicated trickery. The author of this article succeeded in implementing a recursive
version of the Towers of Hanoi on the Microtronic [4][3].

These limitations, however, do no harm to the overall impression of a universal computer
that can be used for a multitude of programming and control tasks. The Microtronic
programs in the manuals are throughout quite general implementations [2]. The NIM game
actually computes the winning numbers for the optimal strategy using the arithmetic
instructions.

Interpreting the Microtronic instruction set naturally costs some time — the operating
speed is therefore quite leisurely. In a YouTube video [3] the author of this article
measured a typical maximum processing speed of about 114 instructions per second. With
the display switched on, the speed even drops to about 40 instructions per second. The
performance achieved by a program of course depends on the instructions used; some
programs even take up to 8 seconds, such as dividing 9999 by 1.

## Manual

The two-volume manual, written by Jörg Vallen and lovingly and humorously illustrated
with the "Buschi" mascot [2], is didactically excellent and was praised by the trade
press — Part 1 introduces the Microtronic, while Part 2 is devoted to more complex
application programs and circuits, as well as experiments with additional Busch
electronics kits. The programs are all from Jörg Vallen's pen.

The programs convince through the generality of their implementation and their ambition.
Highlights here include a moon-landing game, a perpetual calendar, biorhythm calculation,
a calculator, tic-tac-toe, and sine computation. The section on electronics experiments
covers timers, programmable tone and music generators, model-railway control setups, as
well as a digital frequency counter and reaction-time meter.

## Some tricks

The latter can be realized, despite the Microtronic's low operating speed and the
resulting low GPIO sampling rate of about 3 to 4 Hz, by means of a "trick", as can be
read in Jörg Vallen's thesis [1]. Instead of sampling the input via a Microtronic
program, the real-time clock that runs continuously in the background of the firmware is
used here. Input 4 of the Microtronic is used for the 1 Hz clocking of this clock. The
firmware is responsive enough to register clock rates considerably higher than 1 Hz —
input 4 thus allows the registration of frequencies up to 60 Hz. The pulses generated by
an electronic circuit at input 4 are therefore automatically counted by the firmware,
without any involvement of the Microtronic program, and can then be read out by the
Microtronic program via the "get-time" clock instruction (F06).

Plenty of software exists for the Microtronic — in 1983 the book *Computerspiele* [2]
appeared, containing 25 new programs for the Microtronic. Some programs are thoroughly
impressive, such as the prime-number computation program. Others, like "17+4 Blackjack",
are really fun.

## Classic extensions

Among the original extensions, the "2095" cassette interface should be mentioned, though
it goes about its business quite leisurely: a full memory dump takes almost 220 seconds,
corresponding to about 14 baud. The "2092 special interface" can be used, among other
things, to control Fischertechnik robots. It allows the Microtronic's GPIOs to be doubled
and also provides amplifier transistors, with which relays can be switched directly.
There is no dedicated expansion bus on the Microtronic — all extensions are addressed via
the normal Microtronic GPIOs. The DIL socket for connecting the "2095" provides the same
signals as the metal sockets. A speech synthesizer for the Microtronic was announced but
never released.

## Modern extensions

As modern hardware extensions for the Microtronic, the author of this article has
developed an Arduino-based speech synthesizer as well as a "2095" emulator with SD card
[10]. The latter is based on the work of Martin Sauter, who decoded the "2095" cassette-
interface protocol in 2017 and developed a first Raspberry Pi-based emulation of the 2095
in Python. A demo video can be found on the "Mein Elektronik Hobby" YouTube channel [13].

The newest and most general extension is PicoRAM 2090 (see cover image) [9]. It is a
Raspberry Pico-based RAM emulator with SD card. PicoRAM 2090 replaces the Microtronic's
2114 RAM chip, which is then emulated by the Pico in software. Via SD card, 2114 memory
contents can then be loaded and saved, which makes the cassette interface unnecessary. In
addition, PicoRAM realizes a Microtronic memory expansion via bank switching and offers an
extensive I/O expansion. It enables speech synthesis, sound output, text and graphics
output on an OLED display, and additionally provides a battery-backed real-time clock. The
battery-backed time can be loaded directly with the Microtronic's "get-time" instruction.
The PicoRAM I/O extensions are addressed via "redundant", ineffective Microtronic
instructions — 64 such instructions exist in the Microtronic instruction set. As an
example, the instruction group

> "MOV `<x>` → `<x>` (0`<x><x>`)"

can be mentioned: here register `<x>` is copied into register `<x>` — a pointless,
redundant operation, much like a NOP. These instructions therefore do not occur in
"normal" Microtronic programs. PicoRAM 2090 recognizes them and uses them to trigger new
side effects, for example to output a character on the OLED display. A demo video can again
be found on the "Mein Elektronik Hobby" YouTube channel [14]. PicoRAM 2090 won the
"RetroChallenge 2023/10 Grand Prize".

Among current software developments, the project by Björn Rathje should also be mentioned,
who emulated a "Monarch" slot machine on the Microtronic [17].

## Emulators

A number of Microtronic emulators also exist, both software and hardware. The first
software emulator was created in 1985 by the author of this article, on a Schneider
CPC 464 in BASIC. The first C implementation of an emulator for Linux is probably the one
by Ingo D. Rullhusen [5]. There is also an emulator app for the Macintosh [6]. The first
Arduino-based hardware emulator was likewise developed in 2016 by the author [7]. In 2020
it was taken up again by a new team consisting of Frank de Jaeger, Manfred Henf, "Lilly"
and the author of the article, and the "Microtronic 2nd Generation" was created. This is
a professional re-edition with several extensions, built directly into a Busch "2070"
experimentation-kit console. 3D printing was used for the case parts. In 2021 the
"Microtronic Next Generation" variant of this project won the Hackaday "Reinvented Retro
Contest". A further variant (this time with an authentic seven-segment LED display) was
awarded a prize in the "RetroChallenge RC 2021/10".

A new development based on the Microtronic's original firmware is the Phoenix, which we
present in detail on the following page.

## Conclusion

In the comparison between the Philips MasterLab, the Kosmos CP1, and the Busch
Microtronic, this system scores with its easy-to-learn, terse and powerful instruction
set. It enables more complex application programs within the limited memory. Its manuals
are ideal for children and teenagers. The Microtronic can therefore be called the clear
winner in the "educational computer" category. (mw)
