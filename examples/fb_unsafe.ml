let app_id = "1421725008044461"
let domain = "loris-82.comp.nus.edu.sg"

let start _ =
  let init_option = Js.Unsafe.obj [||] in
  let _ = init_option##appId <- Js.string app_id in
  let _ = init_option##channelUrl <- Js.string (domain ^ "/channel.html") in
  let _ = init_option##status <- true in
  let _ = init_option##cookie <- true in
  let _ = init_option##xfbml <- true in
  let _ = Firebug.console##log_2(Js.string ("init variable constructed"),
                                 init_option) in
  let init = Js.Unsafe.fun_call
               (Js.Unsafe.variable "FB.init") [|Js.Unsafe.inject init_option|] in
  let wrapped_init = fun () -> init in
  let async_init = (Js.Unsafe.coerce (Js.string "window"))##fbAsyncInit <- wrapped_init in
  let _ = Firebug.console##log_2
                         ("setting window variable",
                          (Js.Unsafe.coerce (Js.string "window"))##fbAsyncInit) in
  Js._true

let _ = Dom_html.window##onload <- Dom_html.handler start
