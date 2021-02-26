module TagSearch exposing (main)

{-| An example of using the Big Scary Palette Listing to search palettes by tag

If you only need to use a couple of palettes, don't use the searchByTag / findBySlug functions and instead
import only the palettes you need from PaletteList.elm - check out the Basic example for how to do that

If you're confused as to what's going on with the Model/Msg/Update stuff here, check out the Elm Guide:
<https://guide.elm-lang.org/architecture/text_fields.html>

-}

import Browser
import Html
import Html.Attributes as Attributes
import Html.Events as Events
import Json.Decode as Decode
import PaletteView as PaletteView
import Palettes exposing (searchByTag)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { content : String
    }


init : Model
init =
    { content = "" }


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }


{-| Html.Events only has onInput and not onChange so we have to do this ourselves...
-}
onChange : (String -> msg) -> Html.Attribute msg
onChange handler =
    Events.on "change" <| Decode.map handler <| Decode.at [ "target", "value" ] Decode.string


{-| View the tag input + a list of all palettes
Curious as to how the palettes are made? Check out PaletteView.elm!
-}
view : Model -> Html.Html Msg
view model =
    let
        palettes =
            case model.content of
                "" ->
                    []

                _ ->
                    searchByTag model.content
    in
    Html.div mainStyling
        ([ viewInput model
         ]
            ++ List.map PaletteView.view palettes
        )


{-| Display the input where users enter tags
This uses onChange rather than onInput since we don't want to search for "partial" tags
-}
viewInput : Model -> Html.Html Msg
viewInput model =
    Html.input
        [ Attributes.placeholder "Enter a palette tag!"
        , Attributes.value model.content
        , onChange Change
        ]
        []


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
