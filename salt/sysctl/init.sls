{% import_yaml 'sysctl/sysctl.yaml' as sysctlmap %}
{% set sysctls = salt['grains.filter_by'](sysctlmap, grain='system.profile', default='service') %}

{% for sysctl in sysctls.keys() %}
{{ sysctl }}:
  sysctl.present:
    - value: {{ sysctls[sysctl] }}
    - config: /etc/sysctl.d/local.conf
{% endfor %}

