# Nintendo eReader Dotcode encoder/decoder
Copyright (C) 2007 by CaitSith2

This is a command line tool. As such, basic command line usage is assumed. if you don't
know how to use the command line, then you should look up how.

## Usage

```
Usage is "nedcenc [options]"

[options]
        -i <Input file>     (Required)
        -o <Output file>
        
        -e                  Encodes bin dotcode files to raw (-o option required) (default)
        -d                  Decodes raw dotcode files to bin (-o option required)
        -f                  Fixes dotcode raw files.
        
        -s <Signature>      There are either 40 or 44 bytes unused in a dotcode raw
                            file, depending on if the raw is for a long dotcode or
                            short dotcode. You can input any string or hex value.
                            to input spaces, quote the string or use <20>. To insert
                            quotes, use <22>. To insert <, use << or <3C>.
                            To input any hex string, start with <. then input the
                            hex string, then end with >.
                            Example.

                            "<<Dotcode encoded by> -=<<CaitSith2><65027110>"

                            If -s is not specified, dotcodes will be filled with either
                            <2425262728292A2B2C2D2E2F303132333435363738393A3B3C3D3E3F>
                            <404142434445464748494A4B4C4D4E4F> (short)
                            or
                            <38393A3B3C3D3E3F404142434445464748494A4B4C4D4E4F50515253>
                            <5455565758595A5B5C5D5E5F> (long).
```


## E-Reader card info

### Header

```
Offset  Size    Description
0x000   1       xxxxyyyy - xxxx unknown, yyyy region
0x001   1       xxxxyyyy - xxxx card type, yyyy unknown
```

If the region is 0 or 2, then all titles/text have to be in shift-jis format.
If the region is 1, then all titles/text are in ascii format.

### Card Types 0,1 - Pokemon Viewer

### Card Types 2,3,4,5,E - Dotcode Application

#### Struct
```
Offset  Size    Description
0x000   0x0C    Header

Valid application headers

x = don't care
A = number of cards
B = card number
C = Data length * 2
D = Application Type - 0 = GBA/Z80 type, 1 = NES type
E = Individual card title mode bit
F = Permission to save bit

xxxx0000 - Jap original (will also run on Jap plus)
xxxx0001 - US
xxxx0010 - Jap plus
         001xxxxx - Pokemon name/stat mode, load music A
         010xxxxx - Pokemon name/stat mode, load music B
         1110xxxx - Longer title mode, load music A
                  xxxxxxxx xxxxxxxx AAABBBBx CCCCCCCA CCCCCCCC 00000010 00000DEF 00000000 00000000 00000000
```

If the type is 2,3,4, or 5, then the Maximum title length is 16 characters,
Otherwise, if it is E, then the maximum is 32 characters.
The header format is identical between the two.

If the card is in individual card title mode, then the number of titles that have to
follow the application title depends on how many cards are in the set.  If the number
of cards in the set exceeds 8, no individual card titles are displayed, instead, the
ereader logo is displayed. Even though this is the case, you still have to specify
the individual card titles.  Therefore, it is best not to use this mode if the set
is going to require 9 or more cards.  What might fit on 8 cards in normal title mode,
may just require 9 cards in individual title mode, depending on how many bytes are 
required by the compressed application vpk data.

Formats 2,3,4,5 - Card titles follow a format of 3 bytes stats, followed by an 17
character title.

```
ABBBCCCC DDAAAAAA EFFFFDDD
0          654321          - Order of A bits
 210                       - Order of B bits
    3210                   - Order of C bits
         10            432 - Order of D bits
                  0        - Order of E bits
                   3210    - Order of F bits

A = ID: 01-99,A0-A9,B0-B9,C0-C8 (x-AA-x)
B = ID: A-G,# (x-xx-B)
C = HP: 10-150.  A value of 0 means no HP is displayed.
D = ID: A-Z,-,_,{HP},.,{ID},: (D-xx-x)
E = Stat display control. 1 = no stat display.
F = unknown.
```

Format E - Card titles are 32 bytes each.

If the title is NULL, and there is only one card in the application, then the
application is started immediately, upon successful scanning. A NULL titled
application cannot be saved, as the e-reader treats that as having no application
on the save.

If the vpk length - 2 immediately follows the vpk data, then the application
is either Z80 code type, or NES code type, depending on whether the Application
type bit was set or cleered.
However, if the vpk length - 6 follows 4 bytes of 0s, then the vpk data, the
application is GBA code type.  The application type bit must remain cleared.

The max number of application cards is 8 on the original japan ereader, and 12 on
the US ereader and Japan ereader plus.

The original jap E-Reader does not support the GBA/NES application types. Title
formats have to always be individual title mode. Z80 application controller input
is on a different register. Title length in short title mode is 4 bytes less.
Those 4 bytes must be 0 filled.


### Card Types 6,7 - Pokemon Attacks

### Card Types 8,9 - Construction Escape

### Card Types A,B - Construction Action

### Card Types C,D - Construction Melody Box

### Card Types F - Game specific cards.

## Release history

### v1.2
- Functions ported to nedclib.dll. (Source code available seperately)

### v1.1
- Added signature option
- Encoding bin2raw is now default operation.

### v1.0
- Initial release.
- (No longer need to use VBA e-reader for encoding needs)
