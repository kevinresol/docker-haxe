FROM debian:stable

ENV HAXEVER=3.0.1 \
    NEKOVER=2.0.0 \
    HAXEPATH=/root/haxe \
    HAXE_STD_PATH=/root/haxe/std/ \
    NEKOPATH=/root/neko \
    LD_LIBRARY_PATH=/root/neko \
    PATH=/root/haxe:/root/neko:$PATH

RUN export HAXEFILE=haxe-$HAXEVER-linux64.tar.gz && \
    export NEKOFILE=neko-$NEKOVER-linux64.tar.gz && \
    export HAXEURL=http://haxe.org/website-content/downloads/$HAXEVER/downloads/$HAXEFILE && \
    export NEKOURL=http://nekovm.org/media/$NEKOFILE && \
    apt-get update && apt-get install -y wget git && \
    mkdir -p $NEKOPATH && mkdir -p $HAXEPATH && \
    wget $NEKOURL && tar xzf $NEKOFILE --strip=1 -C $NEKOPATH && rm $NEKOFILE && \
    wget $HAXEURL && tar xzf $HAXEFILE --strip=1 -C $HAXEPATH && rm $HAXEFILE && \
    mkdir /root/haxelib  && \
    echo /root/haxelib > /root/.haxelib  && \
    cp /root/.haxelib /etc/
