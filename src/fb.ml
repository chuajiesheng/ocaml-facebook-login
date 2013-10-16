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

let async f =
  let wrapped = fun () -> f in
  (Js.Unsafe.coerce (Js.string "window"))##fbAsyncInit <- wrapped

let subscribe callback =
  Js.Unsafe.fun_call (Js.Unsafe.variable "FB.Event.subscribe")
                     [|Js.Unsafe.inject (Js.string "auth.authResponseChange");
                       Js.Unsafe.inject callback|]

let login callback =
  Js.Unsafe.fun_call (Js.Unsafe.variable "FB.login")
                     [|Js.Unsafe.inject callback|]

let api obj callback =
  Js.Unsafe.fun_call (Js.Unsafe.variable "FB.api")
                     [|Js.Unsafe.inject obj; Js.Unsafe.inject callback|]
