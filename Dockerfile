FROM ocaml/opam

RUN git clone --recursive git://github.com/HaxeFoundation/haxe.git && cd haxe && make && make install