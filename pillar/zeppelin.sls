zeppelin:
  url: salt://oss
  tarball: zeppelin-0.6.0-incubating-SNAPSHOT.tar.gz
  dirname: zeppelin-0.6.0-incubating-SNAPSHOT
  checksum: md5=4dfcb08816d6e01fea4a0a683143ef6d
  env: {"LD_LIBRARY_PATH": "/lib:/usr/local/lib:/lib:/usr/lib", "JAVA_LIBRARY_PATH":"/usr/local/lib:/lib:/usr/lib" }
  cpus: 1
  instances: 1
  server_port: $PORT0
  mem: 1024
  ports: [2999]
  interpreters:
    spark:
      spark.executor.memory: 1G
      spark.eventLog.enabled: true
      spark.serializer: org.apache.spark.serializer.KryoSerializer
      spark.app.name: Zeppelin
      spark.ui.port: 3333
  upgradeStrategy:
    minimumHealthCapacity: 1
  constraints: [['hostname', 'UNIQUE']]
  healthChecks:
    - protocol: HTTP
      portIndex: 0
      path: /
