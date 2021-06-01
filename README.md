# Lospec Palette Scrape

## Elm

This Elm package contains definitions and convenience functions for all palettes on the [Lospec Palette List](https://lospec.com/palette-list).

If using palettes directly from **PaletteList.elm**, hopefully the Elm compiler is smart enough to optimize away any unused palettes! However, if you use the functions provided in **Palettes.elm**, please be aware that your build sizes will be quite large.

None of these palettes are created by me - please use this library for good, and make sure to attribute the original creators wherever possible.

### Examples

Some basic usage examples are included.
These should be easy enough to get going:

```bash
cd examples
elm reactor
```

### Currency

This repository automatically generates Elm code for the current palette list every Friday.

Updates are pushed to Elm packages on an infrequent basis.

## Scraper

This repo also contains a Python script I wrote in order to scrape the latest palette list. For usage information:

```bash
python ./bin/scraper.py -h
```

The _scraped_palettes.json_ file in this repository is updated weekly with the latest color palettes. If you don't use Elm, this file might still be helpful for you!
