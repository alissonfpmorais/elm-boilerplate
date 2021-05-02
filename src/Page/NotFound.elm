module Page.NotFound exposing (Model, Msg, init, subscriptions, toGlobal, update, view)

import Global
import Html exposing (text)
import Page exposing (Page)



-- MODEL


type Model
    = Model Global.Model


init : Global.Model -> ( Model, Cmd Msg )
init global =
    ( Model global
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp


toGlobal : Model -> Global.Model
toGlobal (Model global) =
    global


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Page msg
view (Model _) =
    { title = ""
    , content = text "Página não encontrada"
    }
