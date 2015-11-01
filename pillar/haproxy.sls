haproxy:
  stats.host: '*'
  stats.port: 2413
  stats.username: admin
  stats.password: admin
  server_cert: salt://oss/server.pem
  default_client_cert: salt://oss/ca.crt
  {% if grains['os'].lower() == 'ubuntu' -%}
  {% if grains['oscodename'].lower() == 'trusty' -%}
  repository: deb http://ppa.launchpad.net/vbernat/haproxy-1.5/ubuntu trusty main
  repository_src: deb-src http://ppa.launchpad.net/vbernat/haproxy-1.5/ubuntu trusty main
  version: 1.5.14-1ppa~trusty
  {% elif grains['oscodename'].lower() == 'precise' -%}
  repository: deb http://ppa.launchpad.net/vbernat/haproxy-1.5/ubuntu precise main
  repository_src: deb-src http://ppa.launchpad.net/vbernat/haproxy-1.5/ubuntu precise main
  version: 1.5.14-1ppa~precise
  {% endif %}
  {% endif %}

schedule:
  job-haproxy-reload:
    function: state.sls
    seconds: 3600
    args:
      - haproxy.reload_cfg
    kwargs:
      concurrent: True

haproxy_apps:
  .*:
    - mode: http
      server_cert_on: True
  ignite-mesos: []
  zeppelin:
    - mode: http
      client_cert_on: True
  roles:
    - service_port: 2408
      port: 8001
      query: roles:tachyon.master
      name: tachyon
      client_cert_on: True
      client_cert: salt://oss/ca.crt
    - service_port: 2414
      port: 8773
      httpchk: HEAD /
      query: roles:marathon
      name: marathon
      client_cert_on: True
