FROM centos:7

RUN yum install -yy epel-release \
    && yum install -yy fio mysql sysbench unzip which \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && curl -L https://github.com/pingcap/tidb-bench/archive/master.zip -o tidb-bench.zip \
    && unzip tidb-bench.zip \
    && mv tidb-bench-master/sysbench /sysbench \
    && rm -rf tidb-bench.zip tidb-bench-master

ADD README.md /README.md
