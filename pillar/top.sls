base:
  '*':
    - global
    - riemann
    - marathon
    - system
    - ruby
    - zookeeper
    - cassandra
    - kafka
    - elasticsearch
    - ignite
    - chronos
    - zeppelin
    - postgresql
    - spark
    - hdfs
    - mesos
    - tachyon
  'roles:salt.master':
    - match: grain
    - salt
  'roles:haproxy':
    - match: grain
    - haproxy
