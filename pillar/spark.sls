spark:
  url: salt://oss
  checksum: md5=0df96abd4e7e39ae45e2d52dc69031b5
  tarball: spark-1.5.1-bin-dist.tgz
  dirname: spark-1.5.1-bin-dist
  executor.memory: 2g
  serializer: org.apache.spark.serializer.KryoSerializer
  tachyonStore.baseDir: /cache
  eventlog.dir: /spark-events
  max.dynamic.partitions: 10000
  dynamic.partition: "true"
  dynamic.partition.mode: nonstrict
  hive.username: hive
  hive.password: hive
  sample: 'true'
  ui.port: 2800

sparkjdbc:
  cpus: 1
  instances: 1
  mem: 4096
  ports: [8775, 10000]
  check_port_index: 0
  constraints: [['hostname', 'UNIQUE']]
  upgradeStrategy:
    minimumHealthCapacity: 1
  healthChecks:
    - protocol: HTTP
      portIndex: 0
      path: /

sparkhistory:
  cpus: 0.5
  instances: 1
  mem: 1024
  ports: [5999]
  upgradeStrategy:
    minimumHealthCapacity: 1
  constraints: [['hostname', 'UNIQUE']]
  healthChecks:
    - protocol: HTTP
      portIndex: 0
      path: /
