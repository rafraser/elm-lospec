module Palette exposing
    ( Palette, createPalette
    , getTitle, getColors, getTags, getAuthorName, getUrl
    )

{-| The Palette type and some useful getters.


# Definition

@docs Palette, createPalette


# Getters

@docs getTitle, getColors, getTags, getAuthorName, getUrl

-}

import Color exposing (Color)


{-| The core type for working with Lospec palettes.

Note that this is an opaque type - see the rest of the functions in this file for ways to work with these

-}
type Palette
    = Palette
        { title : String
        , colors : List Color
        , tags : List String
        , authorName : Maybe String
        , url : String
        }


{-| Create a palette from some basic properties

If you're looking at this module, you're probably here for the palette list - in which case this won't be much use to you

-}
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


{-| Get the title of a palette
-}
getTitle : Palette -> String
getTitle (Palette palette) =
    palette.title


{-| Get the title of a palette
-}
getColors : Palette -> List Color
getColors (Palette palette) =
    palette.colors


{-| Get all tags of a palette

While some effort has been taken to keep tags consistent,
since these are freely input by authors on Lospec there is no guarantee that
there will be a lot of consistency.

-}
getTags : Palette -> List String
getTags (Palette palette) =
    palette.tags


{-| Get the name of the creator of a palette

Not all palettes have author names. Some palettes have different formatting for author names.
If you're attributing a palette creator, I'd recommend linking to the Lospec palette page instead.

-}
getAuthorName : Palette -> Maybe String
getAuthorName (Palette palette) =
    palette.authorName


{-| Get the Lospec URL for a palette

If you're specifically using a palette somewhere, show the author some love and link back to it!

-}
getUrl : Palette -> String
getUrl (Palette palette) =
    palette.url
