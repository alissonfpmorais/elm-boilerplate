module Session exposing (Session, flags, guest, navKey)

import Browser.Navigation as Nav
import Flags exposing (Flags)



-- TYPES


type Session
    = Guest Nav.Key Flags



-- INFO


guest : Nav.Key -> Flags -> Session
guest key flags_ =
    Guest key flags_


navKey : Session -> Nav.Key
navKey session =
    case session of
        Guest key _ ->
            key


flags : Session -> Flags
flags session =
    case session of
        Guest _ flags_ ->
            flags_
