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
