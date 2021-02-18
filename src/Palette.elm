module Palette exposing
    ( Palette
    , createPalette
    , getColors
    , getTags
    , getTitle
    , getUrl
    )


type Palette
    = Palette
        { title : String
        , colors : List String
        , tags : List String
        , authorName : Maybe String
        , url : String
        }


createPalette :
    String
    -> List String
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


getColors : Palette -> List String
getColors (Palette palette) =
    palette.colors


getTags : Palette -> List String
getTags (Palette palette) =
    palette.tags


getUrl : Palette -> String
getUrl (Palette palette) =
    palette.url
