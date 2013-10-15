let test_api_call () =
  let obj = Js.string "/me" in
  let callback resp = Firebug.console##log_2("callback", resp##name) in
  let call = Js.Unsafe.fun_call
               (Js.Unsafe.variable "FB.api") [|Js.Unsafe.inject obj; Js.Unsafe.inject callback|] in
  Js._true

let start_2 =
  let callback resp =
    if (resp##status == Js.string "connected") then
      test_api_call ()
    else if (resp##status == Js.string "not_authorized") then
      Js.Unsafe.fun_call (Js.Unsafe.variable "FB.login") [||]
    else
      Js.Unsafe.fun_call (Js.Unsafe.variable "FB.login") [||]
  in
  Js.Unsafe.fun_call (Js.Unsafe.variable "FB.Event.subscribe")
                     [|Js.Unsafe.inject (Js.string "auth.authResponseChange");
                       Js.Unsafe.inject callback|]
