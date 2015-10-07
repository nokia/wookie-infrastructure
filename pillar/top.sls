
{% if 'roles' in grains -%}
{% set grain_roles = grains['roles'] -%}
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
  {% for role in grain_roles -%}
  {% set role_prefix=role.split('.')[0] -%}
  'roles:{{ role }}':
    - match: grain
    - {{ role_prefix }}
  {% endfor %}
{% endif %}
