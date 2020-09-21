# contactApp  

## Introduction

> This repository is home to the code examples. They are designed solely for the purpose of learning a new language. 
Backend is an api written in Rails + Postgres + Docker. Frontend is written in React

## Technical Information and dependencies
- The Ruby language - version 2.7.0
- The Rails gem - version 6.0
- PostgreSQL - version 10
- Docker - version 19.03
- Docker Compose - version 1.26

## Install
Clone the project:

``` Shell
git clone https://github.com/jeslopcru/contactApp.git
cd contactApp
```

## How to run 
We have some scripts to automatize 
### backend 
```shell script
$ cd backend
$ script/setup    # => development bootstrap, preparing containers
$ script/server   # => starts server
$ script/bash   # => starts bash inside container
$ script/test     # => running tests
$ script/clean     # => remove all
```

or you can use Makefile

```shell script
╰─$ make
help                 Prints this help.
backend-setup        setup backend environment
backend-server       Start backend docker-compose
backend-bash         Run bash in docker server
backend-test         Run backend test
backend-clean        Down backend docker compose
```

### frontend
```shell script
$ cd frontend
$ docker-compose up -d --build # => setup and run
$ docker-compose stop # => Stop
$ docker-compose run frontend test # => run test
```

## Frontend

[http://localhost:3001](http://localhost:3001)

## Api Documentation

- Index
```http request
GET http://localhost:3000/contacts
Content-Type: application/json
```
Response 
```http request
HTTP/1.1 200 OK

[
  {
    "id": 20,
    "email": "cesar_mitchell@stanton-monahan.co",
    "first_name": "Thufir Hawat",
    "last_name": "Miles Teg",
    "phone": "+5954371843152",
    "created_at": "2020-09-20T08:07:22.177Z",
    "updated_at": "2020-09-20T08:07:22.177Z"
  }
]
```

- Show
```http request
GET http://localhost:3000/contacts/1
Content-Type: application/json
```
Response 
```http request
HTTP/1.1 200 OK

{
  "id": 1,
  "email": "becki_bergnaum@rosenbaum-rath.biz",
  "first_name": "Edric",
  "last_name": "Otheym",
  "phone": "+2552603108299",
  "created_at": "2020-09-20T08:07:21.860Z",
  "updated_at": "2020-09-20T08:07:21.860Z"
}
```

- Create

````http request
POST http://localhost:3000/contacts
Content-Type: application/json

{
  "email": "becki_bergnaum@rosenbaum-rath.biz",
  "first_name": "Edric",
  "last_name": "Otheym",
  "phone": "+2552603108299"
}
````

Response
```http request
HTTP/1.1 201 Created
{
  "id": 21,
  "email": "kkskksks@rosenbaum-rath.biz",
  "first_name": "Edric",
  "last_name": "Otheym",
  "phone": "+2552603108299",
  "created_at": "2020-09-20T08:57:24.550Z",
  "updated_at": "2020-09-20T08:57:24.550Z"
}
```

- Update
````http request
PUT http://localhost:3000/contacts/1
Content-Type: application/json

{
  "email": "manolo.sanchez@rosenbaum-rath.biz",
  "first_name": "Manolo",
  "last_name": "Sanchez",
  "phone": "+2552603108299"
}
````

Response
```http request
HTTP/1.1 204 No Content
```

- Delete
````http request
DELETE http://localhost:3000/contacts/1
Content-Type: application/json
````

Response
```http request
HTTP/1.1 204 No Content
```


