# API Documentation

  * [RecipesBackendWeb.FoodController](#recipesbackendweb-foodcontroller)
    * [index](#recipesbackendweb-foodcontroller-index)
    * [create](#recipesbackendweb-foodcontroller-create)
    * [show](#recipesbackendweb-foodcontroller-show)
    * [create](#recipesbackendweb-foodcontroller-create)
    * [update](#recipesbackendweb-foodcontroller-update)
    * [show](#recipesbackendweb-foodcontroller-show)
    * [delete](#recipesbackendweb-foodcontroller-delete)
  * [RecipesBackendWeb.PhotoController](#recipesbackendweb-photocontroller)
    * [create](#recipesbackendweb-photocontroller-create)
    * [show](#recipesbackendweb-photocontroller-show)
    * [create](#recipesbackendweb-photocontroller-create)
    * [show](#recipesbackendweb-photocontroller-show)
    * [delete](#recipesbackendweb-photocontroller-delete)
  * [RecipesBackendWeb.RecipeController](#recipesbackendweb-recipecontroller)
    * [index](#recipesbackendweb-recipecontroller-index)
    * [create](#recipesbackendweb-recipecontroller-create)
    * [show](#recipesbackendweb-recipecontroller-show)
    * [create](#recipesbackendweb-recipecontroller-create)
    * [update](#recipesbackendweb-recipecontroller-update)
    * [show](#recipesbackendweb-recipecontroller-show)
    * [update](#recipesbackendweb-recipecontroller-update)
    * [delete](#recipesbackendweb-recipecontroller-delete)
  * [RecipesBackendWeb.ScraperController](#recipesbackendweb-scrapercontroller)
    * [get](#recipesbackendweb-scrapercontroller-get)
  * [RecipesBackendWeb.SessionController](#recipesbackendweb-sessioncontroller)
    * [create](#recipesbackendweb-sessioncontroller-create)
  * [RecipesBackendWeb.UserController](#recipesbackendweb-usercontroller)
    * [create](#recipesbackendweb-usercontroller-create)

## RecipesBackendWeb.FoodController
### <a id=recipesbackendweb-foodcontroller-index></a>index
#### index lists all food
##### Request
* __Method:__ GET
* __Path:__ /api/food
* __Request headers:__
```
accept: application/json
authorization: Token NFNjMmErWndlZThuZWxBUTQvRVZDUT09
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7v4N4CdK6xjwAAADj
```
* __Response body:__
```json
{
  "data": []
}
```

### <a id=recipesbackendweb-foodcontroller-create></a>create
#### create food renders food when data is valid
##### Request
* __Method:__ POST
* __Path:__ /api/food
* __Request headers:__
```
accept: application/json
authorization: Token cFZ3ejFYTEx5SEJ4REN2elNEdmxlQT09
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "food": {
    "name": "some name"
  }
}
```

##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7v-nr7Dn9m7IAAAIl
location: /api/food/2028
```
* __Response body:__
```json
{
  "data": {
    "name": "some name",
    "id": 2028
  }
}
```

### <a id=recipesbackendweb-foodcontroller-show></a>show
#### create food renders food when data is valid
##### Request
* __Method:__ GET
* __Path:__ /api/food/2028
* __Request headers:__
```
accept: application/json
authorization: Token cFZ3ejFYTEx5SEJ4REN2elNEdmxlQT09
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7v-oAYGj9m7IAAARB
```
* __Response body:__
```json
{
  "data": {
    "name": "some name",
    "id": 2028
  }
}
```

### <a id=recipesbackendweb-foodcontroller-create></a>create
#### create food renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/food
* __Request headers:__
```
accept: application/json
authorization: Token RmNxTU5sQTVCem84MmZTTGw3MW5hUT09
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "food": {
    "name": null
  }
}
```

##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7v8RlHhM3F50AAAGk
```
* __Response body:__
```json
{
  "errors": {
    "name": [
      "can't be blank"
    ]
  }
}
```

### <a id=recipesbackendweb-foodcontroller-update></a>update
#### update food renders food when data is valid
##### Request
* __Method:__ PUT
* __Path:__ /api/food/2026
* __Request headers:__
```
accept: application/json
authorization: Token Z2hBK05CdzJ4MXlTWXVHVFUwSmFqQT09
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "food": {
    "name": "some updated name"
  }
}
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7v7L63gdVa3EAAAFk
```
* __Response body:__
```json
{
  "data": {
    "name": "some updated name",
    "id": 2026
  }
}
```

### <a id=recipesbackendweb-foodcontroller-show></a>show
#### update food renders food when data is valid
##### Request
* __Method:__ GET
* __Path:__ /api/food/2026
* __Request headers:__
```
accept: application/json
authorization: Token Z2hBK05CdzJ4MXlTWXVHVFUwSmFqQT09
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7v7MYOtZVa3EAAAGE
```
* __Response body:__
```json
{
  "data": {
    "name": "some updated name",
    "id": 2026
  }
}
```

### <a id=recipesbackendweb-foodcontroller-delete></a>delete
#### delete food deletes chosen food
##### Request
* __Method:__ DELETE
* __Path:__ /api/food/2027
* __Request headers:__
```
accept: application/json
authorization: Token cjZsaFkvZ0dNbmdkaDF2Q2R3MUZmZz09
```

##### Response
* __Status__: 204
* __Response headers:__
```
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7v9XkLHXwsSUAAAEj
```
* __Response body:__
```json

```

## RecipesBackendWeb.PhotoController
### <a id=recipesbackendweb-photocontroller-create></a>create
#### create uploading photo data creates photo with caption
##### Request
* __Method:__ POST
* __Path:__ /api/photos
* __Request headers:__
```
accept: application/json
authorization: Token ekxUcWxuaEcxaGc2Y2ZISEpXTmdUZz09
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "upload": {
    "path": "test/fixtures/test_image.jpg",
    "filename": "test_image.jpg",
    "content_type": null
  },
  "recipe_id": 1765,
  "caption": "test caption"
}
```

##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vgKEupe7r1UAAANh
location: /api/photos/360
```
* __Response body:__
```json
{
  "data": {
    "recipeId": 1765,
    "id": 360,
    "href": "/api/photos/1765/360",
    "caption": "test caption"
  }
}
```

### <a id=recipesbackendweb-photocontroller-show></a>show
#### create uploading photo data creates photo with caption
##### Request
* __Method:__ GET
* __Path:__ /api/photos/360
* __Request headers:__
```
accept: application/json
authorization: Token ekxUcWxuaEcxaGc2Y2ZISEpXTmdUZz09
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vgK2Sgy7r1UAAAOB
```
* __Response body:__
```json
{
  "data": {
    "recipeId": 1765,
    "id": 360,
    "href": "/api/photos/1765/360",
    "caption": "test caption"
  }
}
```

### <a id=recipesbackendweb-photocontroller-create></a>create
#### create photo withouth caption
##### Request
* __Method:__ POST
* __Path:__ /api/photos
* __Request headers:__
```
accept: application/json
authorization: Token QWNheFFlbitkNGt1aFFXYnVvY0tPUT09
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "upload": {
    "path": "test/fixtures/test_image.jpg",
    "filename": "test_image.jpg",
    "content_type": null
  },
  "recipe_id": 1764
}
```

##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vfA4-wi3qWIAAAMB
location: /api/photos/359
```
* __Response body:__
```json
{
  "data": {
    "recipeId": 1764,
    "id": 359,
    "href": "/api/photos/1764/359",
    "caption": null
  }
}
```

### <a id=recipesbackendweb-photocontroller-show></a>show
#### create photo withouth caption
##### Request
* __Method:__ GET
* __Path:__ /api/photos/359
* __Request headers:__
```
accept: application/json
authorization: Token QWNheFFlbitkNGt1aFFXYnVvY0tPUT09
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vfCjc6i3qWIAAAMh
```
* __Response body:__
```json
{
  "data": {
    "recipeId": 1764,
    "id": 359,
    "href": "/api/photos/1764/359",
    "caption": null
  }
}
```

### <a id=recipesbackendweb-photocontroller-delete></a>delete
#### delete deletes the photo by id
##### Request
* __Method:__ DELETE
* __Path:__ /api/photos/361
* __Request headers:__
```
accept: application/json
authorization: Token dGdLcVdUOGVXQlZLS0Qyb3hJeUp4dz09
```

##### Response
* __Status__: 204
* __Response headers:__
```
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vhR_jKzqnUIAAADn
```
* __Response body:__
```json

```

## RecipesBackendWeb.RecipeController
### <a id=recipesbackendweb-recipecontroller-index></a>index
#### index lists all recipes
##### Request
* __Method:__ GET
* __Path:__ /api/recipes
* __Request headers:__
```
accept: application/json
authorization: Token Wm44YkpHdEUwVHJ0REdzamNUUEhuUT09
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7viav9m4X_SwAAAEG
```
* __Response body:__
```json
{
  "data": []
}
```

### <a id=recipesbackendweb-recipecontroller-create></a>create
#### create recipe renders recipe when data is valid
##### Request
* __Method:__ POST
* __Path:__ /api/recipes
* __Request headers:__
```
accept: application/json
authorization: Token UlZTWlZ2bERzL1JmVEdkSCtGa0ViQT09
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "recipe": {
    "title": "some title",
    "servings": 1,
    "kcal": 100,
    "ingredients": [
      {
        "quantity": 1.0,
        "position": 1,
        "name": "Lemon",
        "description": "Piece"
      }
    ],
    "description": "some description"
  }
}
```

##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7voQXGg_JwpIAAAEE
location: /api/recipes/1770
```
* __Response body:__
```json
{
  "data": {
    "title": "some title",
    "servings": 1,
    "photos": [],
    "kcal": 100,
    "ingredients": [],
    "id": 1770,
    "description": "some description"
  }
}
```

### <a id=recipesbackendweb-recipecontroller-show></a>show
#### create recipe renders recipe when data is valid
##### Request
* __Method:__ GET
* __Path:__ /api/recipes/1770
* __Request headers:__
```
accept: application/json
authorization: Token UlZTWlZ2bERzL1JmVEdkSCtGa0ViQT09
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7voSDnIPJwpIAAAEk
```
* __Response body:__
```json
{
  "data": {
    "title": "some title",
    "servings": 1,
    "photos": [],
    "kcal": 100,
    "ingredients": [
      {
        "quantity": 1.0,
        "position": 1,
        "name": "Lemon",
        "description": "Piece"
      }
    ],
    "id": 1770,
    "description": "some description"
  }
}
```

### <a id=recipesbackendweb-recipecontroller-create></a>create
#### create recipe renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/recipes
* __Request headers:__
```
accept: application/json
authorization: Token U3AxQmE0cjZBemdKMEptVWhoYUdTdz09
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "recipe": {
    "title": null,
    "description": null
  }
}
```

##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vlsG0WkPbroAAAQh
```
* __Response body:__
```json
{
  "errors": {
    "title": [
      "can't be blank"
    ]
  }
}
```

### <a id=recipesbackendweb-recipecontroller-update></a>update
#### update recipe renders recipe when data is valid
##### Request
* __Method:__ PUT
* __Path:__ /api/recipes/1768
* __Request headers:__
```
accept: application/json
authorization: Token WnROcG5admF6SVk4d0N6NHhhYnB2Zz09
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "recipe": {
    "title": "some updated title",
    "servings": 2,
    "kcal": 200,
    "ingredients": [
      {
        "quantity": 1.0,
        "position": 1,
        "name": "Lemon",
        "description": "Piece"
      },
      {
        "position": 2,
        "name": "Sugar",
        "description": "much"
      }
    ],
    "description": "some updated description"
  }
}
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vkjrV-4ssLUAAAHF
```
* __Response body:__
```json
{
  "data": {
    "title": "some updated title",
    "servings": 2,
    "photos": [],
    "kcal": 200,
    "ingredients": [],
    "id": 1768,
    "description": "some updated description"
  }
}
```

### <a id=recipesbackendweb-recipecontroller-show></a>show
#### update recipe renders recipe when data is valid
##### Request
* __Method:__ GET
* __Path:__ /api/recipes/1768
* __Request headers:__
```
accept: application/json
authorization: Token WnROcG5admF6SVk4d0N6NHhhYnB2Zz09
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vklgIBossLUAAAPh
```
* __Response body:__
```json
{
  "data": {
    "title": "some updated title",
    "servings": 2,
    "photos": [],
    "kcal": 200,
    "ingredients": [
      {
        "quantity": 1.0,
        "position": 1,
        "name": "Lemon",
        "description": "Piece"
      },
      {
        "quantity": null,
        "position": 2,
        "name": "Sugar",
        "description": "much"
      }
    ],
    "id": 1768,
    "description": "some updated description"
  }
}
```

### <a id=recipesbackendweb-recipecontroller-update></a>update
#### update recipe renders errors when data is invalid
##### Request
* __Method:__ PUT
* __Path:__ /api/recipes/1767
* __Request headers:__
```
accept: application/json
authorization: Token ajhwZlNPZzc0VXBsQUlEOG1hRkROUT09
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "recipe": {
    "title": null,
    "description": null
  }
}
```

##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vjedGwF-fa8AAAGF
```
* __Response body:__
```json
{
  "errors": {
    "title": [
      "can't be blank"
    ]
  }
}
```

### <a id=recipesbackendweb-recipecontroller-delete></a>delete
#### delete recipe deletes chosen recipe
##### Request
* __Method:__ DELETE
* __Path:__ /api/recipes/1769
* __Request headers:__
```
accept: application/json
authorization: Token Y3kxcnF4NnlzdnJLb3BqaGhacWk3QT09
```

##### Response
* __Status__: 204
* __Response headers:__
```
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vmwxHNBrw7kAAADE
```
* __Response body:__
```json

```

## RecipesBackendWeb.ScraperController
### <a id=recipesbackendweb-scrapercontroller-get></a>get
#### get scraped recipe scraping recipe with url
##### Request
* __Method:__ GET
* __Path:__ /api/scraper/chefkoch?url=
* __Request headers:__
```
accept: application/json
authorization: Token Q0hoRUoydUhHOURkK0JOOHR3eU5JZz09
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vy7RCiDgb_gAAAFn
```
* __Response body:__
```json
{
  "data": {
    "title": "Sample Recipe",
    "servings": 4,
    "kcal": 4000,
    "ingredients": [
      {
        "quantity": 123.0,
        "position": 1,
        "name": "Sugar",
        "description": "g"
      },
      {
        "quantity": null,
        "position": 2,
        "name": "Water",
        "description": null
      }
    ],
    "imageUrl": "https://sample.org/recipe.jpg",
    "description": null
  }
}
```

## RecipesBackendWeb.SessionController
### <a id=recipesbackendweb-sessioncontroller-create></a>create
#### creates and renders resource when data is valid
##### Request
* __Method:__ POST
* __Path:__ /api/sessions
* __Request headers:__
```
accept: application/json
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "user": {
    "password": "s3cr3t",
    "email": "foo@bar.com"
  },
  "client":  "some client"
}
```

##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vtgh-vTYCqYAAAEn
```
* __Response body:__
```json
{
  "data": {
    "token": "RlFlMFIyMFh0NVVZQndpc2w2eGZmQT09"
  }
}
```

#### does not create resource and renders errors when password is wrong
##### Request
* __Method:__ POST
* __Path:__ /api/sessions
* __Request headers:__
```
accept: application/json
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "user": {
    "password": "wrong password is wrong",
    "email": "foo@bar.com"
  }
}
```

##### Response
* __Status__: 401
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vqhSofyY1xAAAAIF
```
* __Response body:__
```json
{
  "errors": "Authentication required!"
}
```

#### does not create resource and renders errors when no credentials are given
##### Request
* __Method:__ POST
* __Path:__ /api/sessions
* __Request headers:__
```
accept: application/json
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "user": {}
}
```

##### Response
* __Status__: 401
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vwcPnYQ0w4IAAAFH
```
* __Response body:__
```json
{
  "errors": "Authentication required!"
}
```

## RecipesBackendWeb.UserController
### <a id=recipesbackendweb-usercontroller-create></a>create
#### as an admin user creates user and renders data when request data is valid
##### Request
* __Method:__ POST
* __Path:__ /api/users
* __Request headers:__
```
accept: application/json
authorization: Token UXZsYmVDeXV2a3dFdUpGRG00K25NQT09
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "user": {
    "password": "s3cr3t",
    "email": "foo@bar.com"
  }
}
```

##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vdqrL8ww9lIAAACn
```
* __Response body:__
```json
{
  "data": {
    "id": 1306,
    "email": "foo@bar.com"
  }
}
```

#### as an admin user does not create user and renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/users
* __Request headers:__
```
accept: application/json
authorization: Token Qzl2akVCNTBGRmRCdFM2Zm5vaVM3UT09
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "user": {}
}
```

##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7vcS8t2xc3esAAAKh
```
* __Response body:__
```json
{
  "errors": {
    "email": [
      "can't be blank"
    ]
  }
}
```

#### as a normal user does not create user because user lacks admin privileges
##### Request
* __Method:__ POST
* __Path:__ /api/users
* __Request headers:__
```
accept: application/json
authorization: Token NkRySkpsUUFJZ3huQVpsQ1A1K252Zz09
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "user": {
    "password": "s3cr3t",
    "email": "foo@bar.com"
  }
}
```

##### Response
* __Status__: 403
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
x-request-id: Fnq7va-ZCCdHp24AAAJB
```
* __Response body:__
```json
{
  "errors": "You are not allowed to do that!"
}
```

