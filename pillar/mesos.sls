mesos:
  url: http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.24.1-0.2.35.ubuntu1404_amd64.deb
  libmesos: /usr/local/lib/libmesos.so
  master.port: 5951
  slave.port: 5952
  resources: 'ports(*):[31000-35000,6950-7200,9000-9050,9150-9225,2900-2950]'

mesos-dns:
  url: salt://oss
  checksum: md5=58ebfab9ba4cbf70a8b6572b081ce336
  tarball: mesos-dns-v0.4.0-pre-linux-amd64
  httpport: 8053
  port: 53
  domain: mesos

mesos-services:
  - chronos
  - spark.history
  - spark.jdbc
  - cassandra
  - kafka
  - elasticsearch
  - ignite
