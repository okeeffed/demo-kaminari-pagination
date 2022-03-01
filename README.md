# README

## Steps taken

```s
# Set up project
$ rails new demo-kaminari-pagination -d postgresql
$ cd demo-kaminari-pagination

# Add gems
$ bundler add kaminari

## Set up model
$ bin/rails g model Post title:string rating:integer
$ bin/rails g controller posts index
```

Inside of `db/seeds.rb`:

```rb
Post.create([
              { title: 'First Post', rating: 5 },
              { title: 'Second Post', rating: 5 },
              { title: 'Third Post', rating: 3 },
              { title: 'Fourth Post', rating: 5 },
              { title: 'Fifth Post', rating: 1 },
              { title: 'Sixth Post', rating: 5 },
              { title: 'Seventh Post', rating: 3 },
              { title: 'Eighth Post', rating: 2 },
              { title: 'Ninth Post', rating: 4 },
              { title: 'Tenth Post', rating: 5 },
              { title: 'Eleventh Post', rating: 5 },
              { title: 'Twelfth Post', rating: 5 },
              { title: 'Thirteenth Post', rating: 5 },
              { title: 'Fourteenth Post', rating: 5 },
              { title: 'Fifteenth Post', rating: 3 },
              { title: 'Sixteenth Post', rating: 3 },
              { title: 'Seventeenth Post', rating: 5 },
              { title: 'Eighteenth Post', rating: 4 },
              { title: 'Nineteenth Post', rating: 4 },
              { title: 'Twentieth Post', rating: 5 }
            ])
```

Inside of `app/controllers/posts_controller.rb`:

```rb
class PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts
  end
end
```

Update the `routes.rb` file:

```rb
Rails.application.routes.draw do
  resources :posts, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
```

To create, migrate and insert the data then run the app:

```s
# Create dbs, then run migrations and finally seed
$ bin/rails db:create db:migrate db:seed

# Start up the server
$ bin/rails s
```

If I now use [`httpie`]() for route `localhost:3000/posts`, we will get all posts:

```s
$ http GET localho
st:3000/posts
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"6c25d25ce273f41948efbdea1a498892"
Referrer-Policy: strict-origin-when-cross-origin
Server-Timing: start_processing.action_controller;dur=0.08984375, sql.active_record;dur=6.348876953125, instantiation.active_record;dur=7.771728515625, process_action.action_controller;dur=16.616943359375
Transfer-Encoding: chunked
Vary: Accept
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 736e3368-280d-40ec-9f3a-ee663062c67c
X-Runtime: 0.047404
X-XSS-Protection: 0

[
    {
        "created_at": "2022-02-28T23:33:10.137Z",
        "id": 1,
        "rating": 5,
        "title": "First Post",
        "updated_at": "2022-02-28T23:33:10.137Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.142Z",
        "id": 2,
        "rating": 5,
        "title": "Second Post",
        "updated_at": "2022-02-28T23:33:10.142Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.145Z",
        "id": 3,
        "rating": 3,
        "title": "Third Post",
        "updated_at": "2022-02-28T23:33:10.145Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.148Z",
        "id": 4,
        "rating": 5,
        "title": "Fourth Post",
        "updated_at": "2022-02-28T23:33:10.148Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.151Z",
        "id": 5,
        "rating": 1,
        "title": "Fifth Post",
        "updated_at": "2022-02-28T23:33:10.151Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.155Z",
        "id": 6,
        "rating": 5,
        "title": "Sixth Post",
        "updated_at": "2022-02-28T23:33:10.155Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.157Z",
        "id": 7,
        "rating": 3,
        "title": "Seventh Post",
        "updated_at": "2022-02-28T23:33:10.157Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.160Z",
        "id": 8,
        "rating": 2,
        "title": "Eighth Post",
        "updated_at": "2022-02-28T23:33:10.160Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.163Z",
        "id": 9,
        "rating": 4,
        "title": "Ninth Post",
        "updated_at": "2022-02-28T23:33:10.163Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.165Z",
        "id": 10,
        "rating": 5,
        "title": "Tenth Post",
        "updated_at": "2022-02-28T23:33:10.165Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.168Z",
        "id": 11,
        "rating": 5,
        "title": "Eleventh Post",
        "updated_at": "2022-02-28T23:33:10.168Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.171Z",
        "id": 12,
        "rating": 5,
        "title": "Twelfth Post",
        "updated_at": "2022-02-28T23:33:10.171Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.175Z",
        "id": 13,
        "rating": 5,
        "title": "Thirteenth Post",
        "updated_at": "2022-02-28T23:33:10.175Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.177Z",
        "id": 14,
        "rating": 5,
        "title": "Fourteenth Post",
        "updated_at": "2022-02-28T23:33:10.177Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.181Z",
        "id": 15,
        "rating": 3,
        "title": "Fifteenth Post",
        "updated_at": "2022-02-28T23:33:10.181Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.184Z",
        "id": 16,
        "rating": 3,
        "title": "Sixteenth Post",
        "updated_at": "2022-02-28T23:33:10.184Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.188Z",
        "id": 17,
        "rating": 5,
        "title": "Seventeenth Post",
        "updated_at": "2022-02-28T23:33:10.188Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.191Z",
        "id": 18,
        "rating": 4,
        "title": "Eighteenth Post",
        "updated_at": "2022-02-28T23:33:10.191Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.193Z",
        "id": 19,
        "rating": 4,
        "title": "Nineteenth Post",
        "updated_at": "2022-02-28T23:33:10.193Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.196Z",
        "id": 20,
        "rating": 5,
        "title": "Twentieth Post",
        "updated_at": "2022-02-28T23:33:10.196Z"
    }
]
```

At this stage, we are ready for Kaminari.

## A first example of pagination

Update our controller:

```rb
class PostsController < ApplicationController
  def index
    page = params[:page] || 1
    page_size = params[:page_size] && Integer(params[:page_size]) <= 100 ? params[:page_size] : 10

    posts = Post.page(page).per(page_size)
    render json: posts
  end
end
```

A response for not passing a page and passing `page=2` is as follows:

```s
$ http GET localhost:3000/posts
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"1a803062aa0f401d615e8f892da04644"
Referrer-Policy: strict-origin-when-cross-origin
Server-Timing: start_processing.action_controller;dur=0.107177734375, sql.active_record;dur=46.23681640625, instantiation.active_record;dur=47.073974609375, process_action.action_controller;dur=55.307861328125
Transfer-Encoding: chunked
Vary: Accept
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 4515b80c-a759-472a-a868-c69cb45c04cb
X-Runtime: 0.069243
X-XSS-Protection: 0

[
    {
        "created_at": "2022-02-28T23:33:10.137Z",
        "id": 1,
        "rating": 5,
        "title": "First Post",
        "updated_at": "2022-02-28T23:33:10.137Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.142Z",
        "id": 2,
        "rating": 5,
        "title": "Second Post",
        "updated_at": "2022-02-28T23:33:10.142Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.145Z",
        "id": 3,
        "rating": 3,
        "title": "Third Post",
        "updated_at": "2022-02-28T23:33:10.145Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.148Z",
        "id": 4,
        "rating": 5,
        "title": "Fourth Post",
        "updated_at": "2022-02-28T23:33:10.148Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.151Z",
        "id": 5,
        "rating": 1,
        "title": "Fifth Post",
        "updated_at": "2022-02-28T23:33:10.151Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.155Z",
        "id": 6,
        "rating": 5,
        "title": "Sixth Post",
        "updated_at": "2022-02-28T23:33:10.155Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.157Z",
        "id": 7,
        "rating": 3,
        "title": "Seventh Post",
        "updated_at": "2022-02-28T23:33:10.157Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.160Z",
        "id": 8,
        "rating": 2,
        "title": "Eighth Post",
        "updated_at": "2022-02-28T23:33:10.160Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.163Z",
        "id": 9,
        "rating": 4,
        "title": "Ninth Post",
        "updated_at": "2022-02-28T23:33:10.163Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.165Z",
        "id": 10,
        "rating": 5,
        "title": "Tenth Post",
        "updated_at": "2022-02-28T23:33:10.165Z"
    }
]
# With page=2
$ http GET localhost:3000/posts page=2
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"92407a462bcde135d6b72eeeb71eac83"
Referrer-Policy: strict-origin-when-cross-origin
Server-Timing: start_processing.action_controller;dur=0.205078125, sql.active_record;dur=1.18798828125, instantiation.active_record;dur=0.112060546875, process_action.action_controller;dur=4.8330078125
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: f01b9c3e-2986-4be0-8527-d8ad1c05ebe0
X-Runtime: 0.013718
X-XSS-Protection: 0

[
    {
        "created_at": "2022-02-28T23:33:10.168Z",
        "id": 11,
        "rating": 5,
        "title": "Eleventh Post",
        "updated_at": "2022-02-28T23:33:10.168Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.171Z",
        "id": 12,
        "rating": 5,
        "title": "Twelfth Post",
        "updated_at": "2022-02-28T23:33:10.171Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.175Z",
        "id": 13,
        "rating": 5,
        "title": "Thirteenth Post",
        "updated_at": "2022-02-28T23:33:10.175Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.177Z",
        "id": 14,
        "rating": 5,
        "title": "Fourteenth Post",
        "updated_at": "2022-02-28T23:33:10.177Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.181Z",
        "id": 15,
        "rating": 3,
        "title": "Fifteenth Post",
        "updated_at": "2022-02-28T23:33:10.181Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.184Z",
        "id": 16,
        "rating": 3,
        "title": "Sixteenth Post",
        "updated_at": "2022-02-28T23:33:10.184Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.188Z",
        "id": 17,
        "rating": 5,
        "title": "Seventeenth Post",
        "updated_at": "2022-02-28T23:33:10.188Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.191Z",
        "id": 18,
        "rating": 4,
        "title": "Eighteenth Post",
        "updated_at": "2022-02-28T23:33:10.191Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.193Z",
        "id": 19,
        "rating": 4,
        "title": "Nineteenth Post",
        "updated_at": "2022-02-28T23:33:10.193Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.196Z",
        "id": 20,
        "rating": 5,
        "title": "Twentieth Post",
        "updated_at": "2022-02-28T23:33:10.196Z"
    }
]
```

Passing `page_size` as a value.

```rb
$ http GET localhost:3000/posts page=2 page_size=2
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"d740a4480a5c674e4cd373748aeabeca"
Referrer-Policy: strict-origin-when-cross-origin
Server-Timing: start_processing.action_controller;dur=0.3408203125, sql.active_record;dur=1.013916015625, instantiation.active_record;dur=0.068115234375, process_action.action_controller;dur=4.370849609375
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: a930ea0b-b533-4b0f-8e1e-8e78e5860588
X-Runtime: 0.016528
X-XSS-Protection: 0

[
    {
        "created_at": "2022-02-28T23:33:10.145Z",
        "id": 3,
        "rating": 3,
        "title": "Third Post",
        "updated_at": "2022-02-28T23:33:10.145Z"
    },
    {
        "created_at": "2022-02-28T23:33:10.148Z",
        "id": 4,
        "rating": 5,
        "title": "Fourth Post",
        "updated_at": "2022-02-28T23:33:10.148Z"
    }
]
```

## Updating the controller for more Kaminari helpers

Here we can update the controller:

```rb
class PostsController < ApplicationController
  def index
    page = params[:page] || 1
    page_size = params[:page_size] && Integer(params[:page_size]) <= 100 ? params[:page_size] : 10

    posts = Post.page(page).per(page_size)
    render json: { posts: posts, total_pages: posts.total_pages, current_page: posts.current_page,
                   prev_page: posts.prev_page, next_page: posts.next_page, out_of_range: posts.out_of_range? }
  end
end
```

This returns:

```s
$ http GET localhost:3000/posts page_size=10
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"6a769e1e57280d4e3f5d66498b54a872"
Referrer-Policy: strict-origin-when-cross-origin
Server-Timing: start_processing.action_controller;dur=0.208740234375, sql.active_record;dur=2.0439453125, instantiation.active_record;dur=0.1279296875, process_action.action_controller;dur=6.1162109375
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 786b7b0d-8e55-49bb-9b8d-e512a55d6931
X-Runtime: 0.014969
X-XSS-Protection: 0

{
    "current_page": 1,
    "next_page": 2,
    "out_of_range": false,
    "posts": [
        {
            "created_at": "2022-02-28T23:33:10.137Z",
            "id": 1,
            "rating": 5,
            "title": "First Post",
            "updated_at": "2022-02-28T23:33:10.137Z"
        },
        {
            "created_at": "2022-02-28T23:33:10.142Z",
            "id": 2,
            "rating": 5,
            "title": "Second Post",
            "updated_at": "2022-02-28T23:33:10.142Z"
        },
        {
            "created_at": "2022-02-28T23:33:10.145Z",
            "id": 3,
            "rating": 3,
            "title": "Third Post",
            "updated_at": "2022-02-28T23:33:10.145Z"
        },
        {
            "created_at": "2022-02-28T23:33:10.148Z",
            "id": 4,
            "rating": 5,
            "title": "Fourth Post",
            "updated_at": "2022-02-28T23:33:10.148Z"
        },
        {
            "created_at": "2022-02-28T23:33:10.151Z",
            "id": 5,
            "rating": 1,
            "title": "Fifth Post",
            "updated_at": "2022-02-28T23:33:10.151Z"
        },
        {
            "created_at": "2022-02-28T23:33:10.155Z",
            "id": 6,
            "rating": 5,
            "title": "Sixth Post",
            "updated_at": "2022-02-28T23:33:10.155Z"
        },
        {
            "created_at": "2022-02-28T23:33:10.157Z",
            "id": 7,
            "rating": 3,
            "title": "Seventh Post",
            "updated_at": "2022-02-28T23:33:10.157Z"
        },
        {
            "created_at": "2022-02-28T23:33:10.160Z",
            "id": 8,
            "rating": 2,
            "title": "Eighth Post",
            "updated_at": "2022-02-28T23:33:10.160Z"
        },
        {
            "created_at": "2022-02-28T23:33:10.163Z",
            "id": 9,
            "rating": 4,
            "title": "Ninth Post",
            "updated_at": "2022-02-28T23:33:10.163Z"
        },
        {
            "created_at": "2022-02-28T23:33:10.165Z",
            "id": 10,
            "rating": 5,
            "title": "Tenth Post",
            "updated_at": "2022-02-28T23:33:10.165Z"
        }
    ],
    "prev_page": null,
    "total_pages": 2
}
```

## Setting max in the model

Under the model, we can set some general configuration options as seen [here](https://github.com/kaminari/kaminari#configuring-kaminari).

```rb
class Post < ApplicationRecord
  max_paginates_per 2
end
```

This enforces a max pagination of 2.

```s
$ http GET localhost:3000/posts page_size=10
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"6130c07d440332cbe68917fff659da49"
Referrer-Policy: strict-origin-when-cross-origin
Server-Timing: start_processing.action_controller;dur=0.170166015625, sql.active_record;dur=2.519775390625, instantiation.active_record;dur=0.199951171875, process_action.action_controller;dur=6.281494140625
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 98f4946f-6423-4374-b9f8-898510d6f83f
X-Runtime: 0.016851
X-XSS-Protection: 0

{
    "current_page": 1,
    "next_page": 2,
    "out_of_range": false,
    "posts": [
        {
            "created_at": "2022-02-28T23:33:10.137Z",
            "id": 1,
            "rating": 5,
            "title": "First Post",
            "updated_at": "2022-02-28T23:33:10.137Z"
        },
        {
            "created_at": "2022-02-28T23:33:10.142Z",
            "id": 2,
            "rating": 5,
            "title": "Second Post",
            "updated_at": "2022-02-28T23:33:10.142Z"
        }
    ],
    "prev_page": null,
    "total_pages": 10
}
```
