# README
* Deployment instructions

* ...
# funny_app
```
copy .env.example to .env
```

* Run project with without docker
```
copy database.yml.example to database.yml
```
- init db
```
  rails db:create
  rails db:migrate
```

- Run unitest
```
  rspec
```

* Run project with docker
```
copy database.docker.example to database.yml
```
- Build
```
docker-compose build
```
```
docker-compose run --rm funny_app_rails bundle install
```
```
docker-compose run --rm funny_app_rails rails db:create
```
```
docker-compose run --rm funny_app_rails rails db:migrate
```
- Start
```
docker-compose up -d
```
- Remove
```
docker-compose down -v
```
- Run
```
http://localhost:3018
```
