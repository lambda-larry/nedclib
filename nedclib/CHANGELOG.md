# Changelog

This DLL, and its lib file, is for the development of other nintendo e-reader
related tools.  THe source code is availble, under GPL2.

## 1.3

### Added

- Added multistrip bin support.

### Changed

- Finally ditched the emulation core code for actual reed-solomon
  encoding/decoding functions. (Thanks Martin Korth for finding the code, and
  Simon Rockcliff, Robert Morelos-Zaragoza and Hari Thirumoorthy for writing
  that code.)
- Upgraded bin format to 0x840/0x540 byte format.  (Still need to rebuild
  the rest of my tools for both multistrip bin and multistrip raw format.
  (The tools being nedcprint, and vba e-reader))


## 1.2

### Added

- Added is_bmp(char *bmpfile)
- Added MultiStrip flag;
- Made dpi_multiplier available externally;

## 1.1

### Added

- Added is_nes(unsigned char *nesdata)
- Added is_vpk(unsigned char *bindata)
- Added make_nes(unsigned char *nesdata)
- Added nes_enc(unsigned short NMI_vector)
- Added nes_dec(unsigned short NMI_vector)

## 1.0

- Initial release
