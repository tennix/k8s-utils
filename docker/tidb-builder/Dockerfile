FROM centos:7

RUN yum install -y epel-release \
    && yum install -yy \
    binutils-devel \
    bzip2-devel \
    cmake3 \
    docker-client \
    elfutils-libelf-devel \
    elfutils-devel \
    file \
    gcc \
    gcc-c++ \
    gdb \
    git \
    iproute \
    libdwarf-devel \
    libstdc++-static \
    lz4-devel \
    make \
    mysql \
    net-tools \
    openssl-devel \
    pkg-config \
    psmisc \
    python-pip \
    snappy-devel \
    tar \
    telnet \
    unzip \
    wget \
    which \
    && yum clean all \
    && rm -rf /var/cache/yum

RUN ln -s /usr/bin/cmake3 /usr/bin/cmake

env GFLAGS_VERSION=2.1.2

RUN curl -L https://github.com/gflags/gflags/archive/v${GFLAGS_VERSION}.tar.gz -o /tmp/gflags.tar.gz \
    && tar -C /tmp -xzf /tmp/gflags.tar.gz \
    && cd /tmp/gflags-${GFLAGS_VERSION} \
    && cmake . \
    && make -j \
    && make install

ENV GOLANG_VERSION 1.10.2
ENV GOLANG_DOWNLOAD_SHA256 4b677d698c65370afa33757b6954ade60347aaca310ea92a63ed717d7cb0c2ff

RUN curl -L https://golang.org/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz -o /tmp/golang.tar.gz \
    && echo "$GOLANG_DOWNLOAD_SHA256  /tmp/golang.tar.gz" | sha256sum -c - \
    && tar -C /usr/local -xzf /tmp/golang.tar.gz

RUN curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path --default-toolchain none -y

ENV HOME /root
ENV GOPATH=$HOME/go GOROOT=/usr/local/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.cargo/bin:$PATH
WORKDIR $HOME

RUN git clone https://github.com/pingcap/tidb.git $GOPATH/src/github.com/pingcap/tidb \
    && git clone https://github.com/pingcap/pd.git $GOPATH/src/github.com/pingcap/pd \
    && git clone https://github.com/pingcap/tikv.git $HOME/tikv \
    && go get -u github.com/chzchzchz/goword \
       github.com/coreos/gofail \
       github.com/golang/dep/cmd/dep \
       github.com/kisielk/errcheck \
       github.com/mattn/goveralls \
       golang.org/x/lint/golint \
    && cd $HOME/tikv \
    && rustup override set `tail -n 1 RUST_VERSION` \
    && rustup component add rustfmt-preview --toolchain `tail -n 1 RUST_VERSION` \
    && cargo fetch
