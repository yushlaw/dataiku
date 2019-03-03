docker stop iku || true && docker rm iku || true

docker-compose -f docker-compose.yml up
