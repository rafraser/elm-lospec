module PaletteView exposing (view)

import Color exposing (Color, toCssString)
import Html
import Html.Attributes as Attributes
import Palette as Palette
import PaletteList exposing (oak21)


{-| View a palette box, including a link to the original palette
-}
view : Palette.Palette -> Html.Html msg
view palette =
    Html.div
        []
        [ Html.h1 [ Attributes.style "margin-bottom" "6px" ] [ Html.text (Palette.getTitle palette) ]
        , viewLink (Palette.getUrl palette)
        , viewPaletteBox (Palette.getColors palette)
        ]


{-| Slightly nicer display of a link
-}
viewLink : String -> Html.Html msg
viewLink url =
    Html.a
        [ Attributes.href url
        , Attributes.style "text-decoration" "none"
        ]
        [ Html.text url ]


{-| View the colors that make up a given palette
-}
viewPaletteBox : List Color -> Html.Html msg
viewPaletteBox colors =
    Html.div
        [ Attributes.style "display" "flex"
        , Attributes.style "flex-wrap" "wrap"
        , Attributes.style "margin-top" "6px"
        ]
        (List.map viewColor colors)


{-| View a single color for a palette box
There's definitely better ways to do this if you're so inclined
but this is a decent example of how you can apply a color to a simple box
-}
viewColor : Color -> Html.Html msg
viewColor color =
    Html.div
        [ Attributes.style "background-color" (Color.toCssString color)
        , Attributes.style "height" "32px"
        , Attributes.style "min-width" "12.5%"
        ]
        []


{-| This isn't the most interesting example - sorry.
You'll probably get a lot more use looking at PaletteView.elm instead
-}
main =
    Html.div mainStyling [ view oak21 ]


{-| This isn't strictly important, but it helps make this example
a bit more bearable to look at
-}
mainStyling : List (Html.Attribute msg)
mainStyling =
    [ Attributes.style "font-family" "sans-serif"
    , Attributes.style "width" "60%"
    , Attributes.style "max-width" "600px"
    , Attributes.style "margin" "0 auto"
    ]
