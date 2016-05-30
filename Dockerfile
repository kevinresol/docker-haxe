FROM debian:stable

ENV HAXEVER=3.3.0-rc.1 NEKOVER=2.1.0 \
    HAXEFILE=haxe-$HAXEVER-linux64.tar.gz \
    HAXEURL=http://haxe.org/website-content/downloads/$HAXEVER/downloads/$HAXEFILE \
    HAXEPATH=/root/haxe \
    HAXE_STD_PATH=$HAXEPATH/std/ \
    NEKOFILE=neko-$NEKOVER-linux64.tar.gz \
    NEKOURL=http://nekovm.org/media/$NEKOFILE \
    NEKOPATH=/root/neko \
    LD_LIBRARY_PATH=$NEKOPATH \
    PATH=$HAXEPATH:$NEKOPATH:$PATH

RUN \
  apt-get update && apt-get install -y wget git && \
  mkdir -p $NEKOPATH && mkdir -p $HAXEPATH && \
  wget $NEKOURL && tar xzf $NEKOFILE --strip=1 -C $NEKOPATH  && \
  wget $HAXEURL && tar xzf $HAXEFILE --strip=1 -C $HAXEPATH  && \
  mkdir /root/haxelib  && \
  echo /root/haxelib > /root/.haxelib  && \
  cp /root/.haxelib /etc/
