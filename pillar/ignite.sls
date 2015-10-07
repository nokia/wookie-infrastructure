ignite-mesos:
  cpus: 1
  mem: 1024
  ports: [0]
  environment:
    IGNITE_NODE_COUNT: "2"
    IGNITE_RUN_CPU_PER_NODE: "2"
    IGNITE_MEMORY_PER_NODE: "2048"
  uris:
    - http://as-master/deps/ignite-mesos-1.3.0-incubating-jar-with-dependencies.jar
  healthChecks:
    -  portIndex: 0
       protocol: TCP
       timeoutSeconds: 5
  instances: 1
