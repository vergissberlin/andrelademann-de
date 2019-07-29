# andrelademann.de - Generated static page

## Thanks to

- Inspiration for Docker images https://reyes.im/post/docker-hugo-image/
- Bulma theme for gohugo.io https://github.com/vergissberlin/bulma
- Static page generator https://gohugo.io
- Automated pull+restart on Docker image updates after updates https://containrrr.github.io/watchtower/

## Howto

- Docker labels https://docs.docker.com/compose/compose-file/#labels

### Watchtower

```login
docker login
docker-compose -f docker-compose.watchdog.yml up -d
```
