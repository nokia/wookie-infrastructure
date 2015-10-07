chronos:
  url: http://as-master/deps/
  tarball: chronos-2.3.4.jar
  checksum: md5=3c1e943da88d09bbd003231341134a11
  env: {"LD_LIBRARY_PATH": "/lib:/usr/local/lib:/lib:/usr/lib", "JAVA_LIBRARY_PATH":"/usr/local/lib:/lib:/usr/lib" }
  cpus: 0.5
  instances: 1
  mem: 1024
  ports: [8031]
  upgradeStrategy:
    minimumHealthCapacity: 1
  constraints: [['hostname', 'UNIQUE']]
  healthChecks:
    - protocol: HTTP
      portIndex: 0
      path: /
