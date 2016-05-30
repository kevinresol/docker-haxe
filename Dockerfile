FROM debian:stable

ENV HAXEVER 3.3.0-rc.1
ENV HAXEFILE haxe-$HAXEVER-linux64.tar.gz
ENV HAXEURL http://haxe.org/website-content/downloads/$HAXEVER/downloads/$HAXEFILE
ENV HAXEPATH /root/haxe
ENV HAXE_STD_PATH $HAXEPATH/std/
ENV PATH $HAXEPATH:$PATH

ENV NEKOVER 2.1.0
ENV NEKOFILE neko-$NEKOVER-linux64.tar.gz
ENV NEKOURL http://nekovm.org/media/$NEKOFILE
ENV NEKOPATH /root/neko
ENV LD_LIBRARY_PATH $NEKOPATH
ENV PATH $NEKOPATH:$PATH

RUN \
  apt-get update && apt-get install -y wget && \
  mkdir -p $NEKOPATH && mkdir -p $HAXEPATH && \
  wget $NEKOURL && tar xzf $NEKOFILE --strip=1 -C $NEKOPATH  && \
  wget $HAXEURL && tar xzf $HAXEFILE --strip=1 -C $HAXEPATH  && \
  mkdir /root/haxelib  && \
  echo /root/haxelib > /root/.haxelib  && \
  cp /root/.haxelib /etc/
