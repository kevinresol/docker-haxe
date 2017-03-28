FROM ocaml/ocaml:debian-stable

ENV NEKOVER=2.1.0 \
    NEKOPATH=/root/neko \
    LD_LIBRARY_PATH=/root/neko \
    PATH=/root/neko:$PATH

RUN export NEKOFILE=neko-$NEKOVER-linux64.tar.gz && \
    export NEKOURL=http://nekovm.org/media/$NEKOFILE && \
    apt-get update && \
    apt-get install zlib1g-dev wget camlp4 libpcre3 libpcre3-dev ocaml-findlib -y && \
    mkdir -p $NEKOPATH && \
    wget $NEKOURL && tar xzf $NEKOFILE --strip=1 -C $NEKOPATH && rm $NEKOFILE && \
    git clone --recursive git://github.com/HaxeFoundation/haxe.git && \
    cd haxe && make && make install
