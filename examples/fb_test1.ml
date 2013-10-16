let app_id = "1421725008044461"
let domain = "loris-82.comp.nus.edu.sg"

let start _ =
  let p = Init.empty_params () in
  let _ = p##appId_ <- Js.string app_id in
  let _ = p##channelUrl_ <- Js.string (domain ^ "/channel.html") in
  let _ = p##status_ <- Js._true in
  let _ = p##cookie_ <- Js._true in
  let _ = p##xfbml_ <- Js._true in
  let _ = Firebug.console##log_2(Js.string ("init variable constructed"),
                                 p) in
  let init = Js.Unsafe.fun_call
               (Js.Unsafe.variable "FB.init") [|Js.Unsafe.inject p|] in
  let wrapped_init = fun () -> init in
  let async_init = (Js.Unsafe.coerce (Js.string "window"))##fbAsyncInit <- wrapped_init in
  let _ = Firebug.console##log_2
                         ("setting window variable",
                          (Js.Unsafe.coerce (Js.string "window"))##fbAsyncInit) in
  Js._true

let _ = Dom_html.window##onload <- Dom_html.handler start
