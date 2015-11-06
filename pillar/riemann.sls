riemann:
  url: salt://oss
  checksum: md5=c15e245a0658b9f1fe56137f523af59a
  tarball: riemann-0.2.10.tar.bz2
  dirname: riemann-0.2.10
  tools.version: 0.2.7
  dash.version: 0.2.11
  client.version: 0.2.5
  hadoop.version: 0.1.1
  postgresql.version: 0.1.1
  json_http.version: 0.1.5
  jmx_url: salt://oss/riemann-jmx-clj-0.1.0-SNAPSHOT-standalone.jar
  jmx_checksum: md5=915a5a9365ec86848691ab922b59c218
  extra_url: salt://oss/riemann-extra-0.2.4-standalone.jar
  extra_checksum: md5=ad9396c5cd62c0396e48fe311798d737
  user: riemann
  group: riemann
  dash.port: 2421
  server.port: 2422
  ws.port: 2423
  repl.port: 2424
  interval: 10
  timeout: 30
  tcp: 'false'

schedule:
  job-riemann-reload:
    function: state.sls
    seconds: 3600
    args:
      - riemann.agent_checks
    kwargs:
      concurrent: True

riemann_checks:
  proc:
    hdfs.namenode:
      - regexp: NameNode
        name: namenode-check
      - regexp: DFSZK
        name: zkfc-check
    hdfs.journalnode:
      - regexp: JournalNode
        name: journalnode-check
    hdfs.datanode:
      - regexp: DataNode
        name: datanode-check
    mesos.master:
      - regexp: mesos-master
        name: mesos-master-check
    mesos.slave:
      - regexp: mesos-slave
        name: mesos-slave-check
    tachyon.master:
      - regexp: TachyonMaster
        name: tachyon-master-check
    tachyon.slave:
      - regexp: TachyonWorker
        name: tachyon-worker-check
    zookeeper.server:
      - regexp: QuorumPeerMain
        name: zookeeper-check
    postgresql:
      - regexp: bin/postgres
        name: postgres-check
    haproxy:
      - regexp: haproxy
        name: haproxy-check
    marathon:
      - regexp: marathon-assembly
        name: marathon-check
  http:
    elasticsearch:
      endpoint: _/nodes/_local/stats/http,indices,fs
    mesos.*:
      endpoint: /metrics/snapshot
    marathon:
      endpoint: /metrics
    spark.*:
      endpoint: /metrics/json
  jmx:
    cassandra-mesos:
      - obj: "org.apache.cassandra.metrics:type=DroppedMessage,scope=READ,name=Dropped"
        attr: [ Count ]
      - obj: "org.apache.cassandra.metrics:type=DroppedMessage,scope=MUTATION,name=Dropped"
        attr: [ Count ]
      - obj: "org.apache.cassandra.metrics:type=DroppedMessage,scope=COUNTER_MUTATION,name=Dropped"
        attr: [ Count ]
      - obj: "org.apache.cassandra.metrics:type=ColumnFamily,name=WriteLatency"
        attr: [ Count, Mean, 50thPercentile, StdDev, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "org.apache.cassandra.metrics:type=ColumnFamily,name=ReadLatency"
        attr: [ Count, Mean, 50thPercentile, StdDev, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "org.apache.cassandra.metrics:type=ThreadPools,path=request,scope=CounterMutationStage,name=ActiveTasks"
        attr: [ Value ]
      - obj: "org.apache.cassandra.metrics:type=ThreadPools,path=request,scope=MutationStage,name=ActiveTasks"
        attr: [ Value ]
      - obj: "org.apache.cassandra.metrics:type=ThreadPools,path=request,scope=ReadStage,name=ActiveTasks"
        attr: [ Value ]
      - obj: "org.apache.cassandra.metrics:type=ThreadPools,path=request,scope=CounterMutationStage,name=PendingTasks"
        attr: [ Value ]
      - obj: "org.apache.cassandra.metrics:type=ThreadPools,path=request,scope=MutationStage,name=PendingTasks"
        attr: [ Value ]
      - obj: "org.apache.cassandra.metrics:type=ThreadPools,path=request,scope=ReadStage,name=PendingTasks"
        attr: [ Value ]
      - obj: "org.apache.cassandra.metrics:type=Storage,name=Load"
        attr: [ Count ]
      - obj: "org.apache.cassandra.metrics:type=Storage,name=Exceptions"
        attr: [ Count ]
    kafka-mesos:
      - obj: "kafka.server:type=BrokerTopicMetrics,name=BytesInPerSec"
        attr: [ Count, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "kafka.server:type=BrokerTopicMetrics,name=BytesOutPerSec"
        attr: [ Count, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "kafka.server:type=BrokerTopicMetrics,name=FailedFetchRequestsPerSec"
        attr: [ Count, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "kafka.server:type=BrokerTopicMetrics,name=FailedProduceRequestsPerSec"
        attr: [ Count, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec"
        attr: [ Count, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "kafka.server:type=ReplicaManager,name=PartitionCount"
        attr: [ Value ]
      - obj: "kafka.network:type=RequestChannel,name=RequestQueueSize"
        attr: [ Value ]
      - obj: "kafka.controller:type=KafkaController,name=ActiveControllerCount"
        attr: [ Value ]
