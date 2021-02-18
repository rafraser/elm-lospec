module Palettes exposing
    ( findBySlug
    , searchByTag
    )

import Dict
import Palette
import PaletteList exposing (paletteList)


findBySlug : String -> Maybe Palette.Palette
findBySlug slug =
    Dict.get slug paletteList


searchByTag : String -> List Palette.Palette
searchByTag tag =
    Dict.filter (\_ v -> List.member tag <| Palette.getTags v) paletteList
        |> Dict.values
