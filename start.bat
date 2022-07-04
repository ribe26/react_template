cd /d　%~dp0
mkdir front
docker-compose build
docker-compose up -d

docker exec -it node npx create-react-app . --template typescript --use-npm
docker exec -it node npx eslint --init
docker exec -it node npm i -D prettier eslint-config-prettier eslint-plugin-prettier pretty-quick

copy .\temp .\front

docker exec -it node npx eslint --fix src/**/*.ts*
docker stop node

copy .\temp\dockerfile .
