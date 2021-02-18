module Palette exposing
    ( Palette
    , createPalette
    , getColors
    , getTags
    , getTitle
    , getUrl
    )

import Color exposing (Color)


type Palette
    = Palette
        { title : String
        , colors : List Color
        , tags : List String
        , authorName : Maybe String
        , url : String
        }


createPalette :
    String
    -> List Color
    -> List String
    -> Maybe String
    -> String
    -> Palette
createPalette title colors tags authorName url =
    Palette
        { title = title
        , colors = colors
        , tags = tags
        , authorName = authorName
        , url = url
        }


getTitle : Palette -> String
getTitle (Palette palette) =
    palette.title


getColors : Palette -> List Color
getColors (Palette palette) =
    palette.colors


getTags : Palette -> List String
getTags (Palette palette) =
    palette.tags


getUrl : Palette -> String
getUrl (Palette palette) =
    palette.url
