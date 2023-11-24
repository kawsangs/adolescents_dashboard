FROM grafana/grafana-oss:10.1.4

LABEL maintainer="Sokly <sokly@kawsang.com>"

ENV PATH=/usr/share/grafana/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
  GF_PATHS_CONFIG="/etc/grafana/grafana.ini" \
  GF_PATHS_PROVISIONING="/etc/grafana/provisioning"

COPY ./grafana/grafana.ini $GF_PATHS_CONFIG
COPY ./grafana/provisioning/datasources $GF_PATHS_PROVISIONING/datasources
COPY ./grafana/provisioning/dashboards  $GF_PATHS_PROVISIONING/dashboards

## Replace Favicon and Apple Touch
COPY img/fav32.png /usr/share/grafana/public/img
COPY img/fav32.png /usr/share/grafana/public/img/apple-touch-icon.png

## Replace Logo
COPY img/logo.svg /usr/share/grafana/public/img/grafana_icon.svg

EXPOSE 3000
