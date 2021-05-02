module Page.Home exposing (Model, Msg, init, subscriptions, toGlobal, update, view)

import Global
import Html exposing (Html, blockquote, div, p, text)
import Html.Attributes exposing (class)
import Page exposing (Page)



-- MODEL


type Model
    = Model Global.Model Internals


type alias Internals =
    {}


init : Global.Model -> ( Model, Cmd Msg )
init global =
    ( Model global {}
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp


toGlobal : Model -> Global.Model
toGlobal (Model global _) =
    global


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        ( _, _ ) =
            case model of
                Model global_ internals_ ->
                    ( global_, internals_ )
    in
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Page Msg
view (Model _ _) =
    { title = "Home"
    , content = viewMain
    }


viewMain : Html Msg
viewMain =
    div
        [ class "md:flex bg-gray-100 rounded-xl p-8 md:p-0" ]
        [ div
            [ class "w-32 h-32 md:w-48 md:h-auto md:rounded-none rounded-full mx-auto bg-purple-400" ]
            []
        , div
            [ class "pt-6 md:p-8 text-center md:text-left space-y-4" ]
            [ blockquote
                []
                [ p
                    [ class "text-lg font-semibold" ]
                    [ text "Tailwind CSS is the only framework that I've seen scale on large teams. It’s easy to customize, adapts to any design, and the build size is tiny."
                    ]
                ]
            , div
                [ class "font-medium" ]
                [ div
                    [ class "text-cyan-600" ]
                    [ text "Sarah Dayan" ]
                , div
                    [ class "text-gray-300" ]
                    [ text "Staff Engineer, Algolia" ]
                ]
            ]
        ]
