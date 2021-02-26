module Basic exposing (main)

{-| A super simple example of visualising one single palette from the list

If you're only visualising a few palettes, this is the way I'd recommend!
Avoid importing the giant dictionary, and only import what you need.

For more info as to how the palettes are actually displayed here, you should check out PaletteView.elm!

-}

import Html
import Html.Attributes as Attributes
import PaletteList exposing (oak21)
import PaletteView as PaletteView


{-| This isn't the most interesting example - sorry.
You'll probably get a lot more use looking at PaletteView.elm instead
-}
main =
    Html.div mainStyling [ PaletteView.view oak21 ]


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
