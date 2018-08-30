FROM golang:1.10 AS builder

RUN git clone https://github.com/pingcap/go-ycsb $GOPATH/src/github.com/pingcap/go-ycsb \
    && cd $GOPATH/src/github.com/pingcap/go-ycsb \
    && make

FROM centos:7

COPY --from=builder /go/src/github.com/pingcap/go-ycsb/bin/go-ycsb /go-ycsb/bin/go-ycsb
COPY --from=builder /go/src/github.com/pingcap/go-ycsb/workloads /go-ycsb/workloads
COPY --from=builder /go/src/github.com/pingcap/go-ycsb/tool /go-ycsb/tool

RUN yum install -yy epel-release \
    && yum install -yy fio mysql sysbench unzip which \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && curl -L https://github.com/pingcap/tidb-bench/archive/master.zip -o tidb-bench.zip \
    && unzip tidb-bench.zip \
    && mv tidb-bench-master/sysbench /sysbench \
    && rm -rf tidb-bench.zip tidb-bench-master

ADD README.md /README.md
