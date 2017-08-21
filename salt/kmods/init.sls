{% import_yaml 'kmods/kmods.yaml' as kmodmap %}
{% set kmods = salt['grains.filter_by'](kmodmap, grain='system.profile', default='service') %}

include:
{% for kmod in kmods %}
  - kmods/{{ kmod }}
{% endfor %}

