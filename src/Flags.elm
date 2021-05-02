module Flags exposing
    ( Flags
    , decode
    , default
    )

import Json.Decode as Decode exposing (Decoder)



-- TYPES


type alias Flags =
    {}



-- INFO


default : Flags
default =
    {}



-- DECODER


decode : Decoder Flags
decode =
    Decode.succeed Flags
