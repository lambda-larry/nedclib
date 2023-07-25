# Changelog

## 1.2

### Added

### Fixed

- Fixed a title processing bug that happens when `-region` is specified after
  `-name/-title`.  (oops)
- Short titles on japanese e-reader used 8 bit characters rather than 16 bit
  shift-jis characters.  (Thanks Martin Korth).

### Changed

- Removed the requirement to specify a filetype option. raw is default output
  format now.

## 1.1

### Added

- Added automatic vpk compression (lzwindow 16384, lzsize 2048, level 2, method 0)
- Added automatic conversion to raw (-raw option).
- Added automatic conversion to bmp (-bmp option).
- Added support for loading Mapper 0 16K prg 8K chr nes roms.

### Changed

- Ported to use nedclib.dll
- Output of bin files optional (specify -bin for output).

## 1.0

### Added

- Initial release

