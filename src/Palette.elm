module Palette exposing
    ( Palette
    , createPalette
    , getAuthorName
    , getColors
    , getCreatedAt
    , getDescription
    , getTags
    , getTitle
    , getUrl
    )


type Palette
    = Palette
        { title : String
        , description : String
        , colors : List String
        , tags : List String
        , createdAt : String
        , authorName : Maybe String
        , url : String
        }


createPalette :
    String
    -> String
    -> List String
    -> List String
    -> String
    -> Maybe String
    -> String
    -> Palette
createPalette title description colors tags createdAt authorName url =
    Palette
        { title = title
        , description = description
        , colors = colors
        , tags = tags
        , createdAt = createdAt
        , authorName = authorName
        , url = url
        }


getTitle : Palette -> String
getTitle (Palette palette) =
    palette.title


getDescription : Palette -> String
getDescription (Palette palette) =
    palette.description


getColors : Palette -> List String
getColors (Palette palette) =
    palette.colors


getTags : Palette -> List String
getTags (Palette palette) =
    palette.tags


getCreatedAt : Palette -> String
getCreatedAt (Palette palette) =
    palette.createdAt


getAuthorName : Palette -> Maybe String
getAuthorName (Palette palette) =
    palette.authorName


getUrl : Palette -> String
getUrl (Palette palette) =
    palette.url
