# contactApp  

## Introduction

> This repository is home to the code examples. They are designed solely for the purpose of learning a new language. 
backend is an api written in Rails + Postgres + Docker.

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

### To run 
We have some scripts to automatize in backend/script.


```shell script
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
setup                setup environment
server               Start all docker-compose
bash                 Run bash in docker server
test                 Run test
clean                Down all docker compose
```

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
    "second_name": "Miles Teg",
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
  "second_name": "Otheym",
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
  "second_name": "Otheym",
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
  "second_name": "Otheym",
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
  "second_name": "Sanchez",
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


