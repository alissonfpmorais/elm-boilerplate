module Route exposing
    ( Route(..)
    , fromUrl
    , href
    , pushUrl
    , replaceUrl
    )

import Browser.Navigation as Nav
import Html exposing (Attribute)
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Builder
import Url.Parser as Parser exposing (Parser, oneOf, s, top)



-- ROUTING


type Route
    = NotFound
    | Home


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map NotFound (s "not-found")
        , Parser.map Home top
        ]



-- PUBLIC HELPERS


href : Route -> Attribute msg
href targetRoute =
    Attr.href (routeToString targetRoute)


replaceUrl : Nav.Key -> Route -> Cmd msg
replaceUrl key route =
    Nav.replaceUrl key (routeToString route)


pushUrl : Nav.Key -> Route -> Cmd msg
pushUrl key route =
    Nav.pushUrl key (routeToString route)


fromUrl : Url -> Maybe Route
fromUrl url =
    Parser.parse parser url



-- INTERNAL


routeToString : Route -> String
routeToString page =
    let
        ( path, query ) =
            case page of
                NotFound ->
                    ( [ "not-found" ], [] )

                Home ->
                    ( [], [] )
    in
    Url.Builder.absolute path query
