# adolescents_dashboard
is grafana dashboard visualization of the adolescents [web-app](https://github.com/kawsangs/adolescents_web)


## Development Setup
### System dependencies

adolescents_dashboard is a [grafana/grafana-oss:9.2.1](https://grafana.com/grafana/download/9.2.1?edition=oss&platform=docker) image base application, and it also needs the following services to run:
- Docker
- Docker Compose

### Configuration
In ```app.env``` file: copy content in ```app.env.example``` to the file


1. To enable feature **Sign in with Oauth from adolescents_web**:
The Client ID and Clinent Secret obtained from the [adolescents_web](http://localhost:3000/oauth/applications). Replace with your own Client ID and Client Secret

```
GF_AUTH_GENERIC_OAUTH_CLIENT_ID=client_id
GF_AUTH_GENERIC_OAUTH_CLIENT_SECRET=client_secret
```
and

```
GF_AUTH_GENERIC_OAUTH_AUTH_URL = http://ip_address:3000/oauth/authorize
GF_AUTH_GENERIC_OAUTH_TOKEN_URL = http://ip_address:3000/oauth/token
GF_AUTH_GENERIC_OAUTH_API_URL = http://ip_address:3000/oauth/token/info
```

2. To enable panel map render as **Cambodia Map**:
- Pull down [adolescents_web](https://github.com/kawsangs/adolescents_web)
- Run the application with port 3000
- Update ```grafana/provisioning/dashboards/dashboard.json``` with the following

```
"geoJsonUrl": "http://localhost:3000/provinces.json",
```

3. To set default datasource
- Update ```grafana/provisioning/datasources/default.yml``` with

```
url: ip_address:port
```

example:
```
url: 192.168.0.1:5432
```

## Installation
- Install [Docker](https://docs.docker.com/get-docker/)
- install [Docker Compose](https://docs.docker.com/compose/install/)

## Docker development
```docker-compose.yml``` file builds a development environment mounting the current folder and running application in a development environment.

Run the following commands to have a stable development environment.
```
$ docker-compose up
```
And visit [localhost:8000](localhost:8000)

