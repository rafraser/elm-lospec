module Palettes exposing (findBySlug, searchByTag)

{-| Useful functions for finding palettes from the palette list

Internally, these functions search through a giant Dict of palettes.
This does mean that if you use these functions, you'll probably increase your asset size by quite a lot.

If you only need to use one specific palette, each palette has an individual function in PaletteList.elm

@docs findBySlug, searchByTag

-}

import Dict
import Palette
import PaletteList exposing (paletteList)


{-| Find a palette by "key"

You can easily spot the slug from a Lospec palette url, eg:

<https://lospec.com/palette-list/oak21> -> "oak21"

-}
findBySlug : String -> Maybe Palette.Palette
findBySlug slug =
    Dict.get slug paletteList


{-| Return a list of any palettes tagged with the specified string

Keep in mind that since tags are user input, there's no guarantees of consistency.
You can view the tags for a palette on its Lospec palette page

There's a lot of palettes, so use this carefully - it's probably a tad slow.

-}
searchByTag : String -> List Palette.Palette
searchByTag tag =
    Dict.filter (\_ v -> List.member tag <| Palette.getTags v) paletteList
        |> Dict.values
