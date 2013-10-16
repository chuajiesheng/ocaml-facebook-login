class type params = object
  method appId_ : Js.js_string Js.t Js.prop
  method channelUrl_ : Js.js_string Js.t Js.prop
  method status_ : bool Js.t Js.prop
  method cookie_ : bool Js.t Js.prop
  method xfbml_ : bool Js.t Js.prop
end

let empty_params () = Js.Unsafe.obj [||]

let init (p : params Js.t) =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "FB.init") [|Js.Unsafe.inject p|]
