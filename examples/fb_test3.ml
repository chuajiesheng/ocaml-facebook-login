let app_id = "1421725008044461"
let domain = "loris-82.comp.nus.edu.sg"

let start _ =
  let p = Fb.empty_params () in
  let _ = p##appId_ <- Js.string app_id in
  let _ = p##channelUrl_ <- Js.string (domain ^ "/channel.html") in
  let _ = p##status_ <- Js._true in
  let _ = p##cookie_ <- Js._true in
  let _ = p##xfbml_ <- Js._true in
  let _ = Firebug.console##log_2(Js.string ("init variable constructed"),
                                 p) in

  let init = Fb.init(p) in
  let async = Fb.async init in
  let _ = Firebug.console##log_2
                         ("setting window variable",
                          (Js.Unsafe.coerce (Js.string "window"))##fbAsyncInit) in
  Js._true

let _ = Dom_html.window##onload <- Dom_html.handler start

let callback resp =
    Firebug.console##log(Js.string "resp");
    Firebug.console##log(resp);
    Firebug.console##log(resp##id);
    Firebug.console##log(resp##name);
    Firebug.console##log(resp##email)

let test_api_call () =
  let obj = Js.string "/me" in
  let call = Fb.api obj callback in
  Js._true

let start_2 =
  let callback resp =
    let _ = Firebug.console##log(resp) in
    if (resp##status == Js.string "connected") then
      test_api_call ()
    else if (resp##status == Js.string "not_authorized") then
      Fb.login callback
    else
      Fb.login callback
  in
  Fb.subscribe callback
