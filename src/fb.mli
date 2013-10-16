class type params = object
  method appId_ : Js.js_string Js.t Js.prop
  method channelUrl_ : Js.js_string Js.t Js.prop
  method status_ : bool Js.t Js.prop
  method cookie_ : bool Js.t Js.prop
  method xfbml_ : bool Js.t Js.prop
end

val empty_params : unit -> params Js.t

val init : params Js.t -> 'a

val async : 'a -> unit
