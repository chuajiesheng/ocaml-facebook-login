#ocaml-facebook-login

A OCaml binding for [facebook-login](https://developers.facebook.com/docs/facebook-login/getting-started-web/)
done via [Js_of_OCaml](http://ocsigen.org/js_of_ocaml) library. The src folder contains the binding library
for the JavaScript SDK. The examples in the examples folder is designed to run in
[loris-88](loris-88.ddns.comp.nus.edu.sg) currently.

##Installation
    make; make install

##Dependency
1. lwt ( >= 2.4 )
2. deriving-ocsigen
3. ocamlfind

Best to do the installation via [OPAM](http://opam.ocamlpro.com/index.html) in case you have dependency issues.

##Usage
Code; Link to ocaml-facebook-login package; Generate .js

    ocamlfind ocamlc -annot -linkpkg -package js_of_ocaml -package js_of_ocaml.syntax -package lwt -package ocaml-facebook-login -syntax camlp4o -o example.ml
    js_of_ocaml example.byte -pretty
    rm example.byte

Link to .JS

    <script src="https://connect.facebook.net/en_US/all.js"></script>
    <script src="example.js"></script>

##Example
There is a example for every method present in the binding.
See example folder

##Notes
1. If you encounter any issue during the build process, try "make distclean" to update the .depend files.
