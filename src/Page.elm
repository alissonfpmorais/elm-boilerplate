module Page exposing (Page, view)

import Browser exposing (Document)
import Html exposing (Html, footer, header, main_)



-- TYPES


type alias Page msg =
    { title : String
    , content : Html msg
    }



-- VIEW


view : Page msg -> Document msg
view { title, content } =
    { title = title ++ " - Elm Boilerplate"
    , body = [ viewHeader, viewMain content, viewFooter ]
    }


viewHeader : Html msg
viewHeader =
    header
        []
        []


viewMain : Html msg -> Html msg
viewMain content =
    main_
        []
        [ content ]


viewFooter : Html msg
viewFooter =
    footer
        []
        []
