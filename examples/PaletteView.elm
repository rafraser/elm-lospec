module PaletteView exposing (view)

import Color exposing (Color, toCssString)
import Html
import Html.Attributes as Attributes
import Palette as Palette


{-| View a palette box, including a link to the original palette
-}
view : Palette.Palette -> Html.Html msg
view palette =
    let
        urlText =
            Palette.getUrl palette
    in
    Html.div
        []
        [ Html.h1 [] [ Html.text (Palette.getTitle palette) ]
        , Html.a [ Attributes.href urlText ] [ Html.text urlText ]
        , viewPaletteBox (Palette.getColors palette)
        ]


{-| View the colors that make up a given palette
-}
viewPaletteBox : List Color -> Html.Html msg
viewPaletteBox colors =
    Html.div
        [ Attributes.style "display" "flex"
        , Attributes.style "flex-wrap" "wrap"
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
