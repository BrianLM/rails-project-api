# The Smart-Shop API

https://brianlm.github.io/smart-shop/index.html

This API is designed to support the Smart-Shop application for reuse over the internet. It allows users to create and manage accounts as well as their lists and list items and items.

The API sanitizes request per user but does not validate naming and prior presence of items.

## Deployment
The production database is hosted by Heroku at https://fast-taiga-19098.herokuapp.com

## Technologies used
API is written with Rails, utilizing the standard ActiveRecord, Ruby, along with custom routing and serialization.

## Authentication API
Authentication of the user actions comes from the User API controller. This object was provided, and follows the provided methods.

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| DELETE | `/sign-out/:id`        | `users#signout`   |
| PATCH  | `/change-password/:id` | `users#changepw`  |

A route excluded from production includes a method to query the user's id from email address for list sharing functionality.

## Lists API
The Lists API handles all list actions, and includes create, read, update and destroy actions for the user's lists. This controller inherits from ProtectedController. No unauthenticated actions are available.

All actions must include an Authentication token in the header. Requests not including an authentication token will have a response of Access Denied.

No fields are required. Front end control is present for Active values.

List calls expect a list ID, and a name. The boolean active controls visibility. A successful request will include the List, as well as associated List Items, and associated Items via List Items if any List Items are present.


| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/lists/`              | `lists#create`    |
| GET    | `/lists/`              | `lists#index`     |
| GET    | `/lists/:id`           | `lists#show`      |
| DELETE | `/lists/:id`           | `lists#destroy`   |
| PATCH  | `/lists/:id`           | `lists#update`    |

Available but not active is a create list with list items. Both methods on the controller and routes are not available at this time.

## Items API
The Items API handles all item actions, and includes create, update, search by name, index, and read actions for items. No current uses for delete, so functionality is removed in the controller and routes. Front end controls on update as well as controller limitations on updating a record restrict updates to user ownership. This controller inherits from ProtectedController. No unauthenticated actions are available, however index and search actions will return non-user related items.

Items calls require a name, unit and unit_quantity for creation. A successful request will return the item or items related to the request.

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/items`               | `items#index`     |
| GET    | `/items/:id`           | `items#show`      |
| GET    | `/search_items/:id`    | `items#search`    |
| Update | `/items/:id`           | `items#update`    |

Available but not active are routing for only user associated items, as well as controller actions. Based on desire for croud-source, items are not limited to users.


## List_items API
The List Items API handles all list item actions, and includes create, read, update, and destroy actions for the user's lists. No current uses for index, so functionality is removed in the controller and routes. No use case is available that supports listing all list items. This controller inherits from ProtectedController. No unauthenticated actions are available.

List Items are created with a list ID and item ID, and need a quantity to create. A successful request will return the new list item as well as the associated list and item records

| Verb   | URI Pattern            | Controller#Action   |
|--------|------------------------|---------------------|
| POST   | `/list_items`          | `list_items#create` |
| GET    | `/list_items/:id`      | `list_items#show`   |
| PATCH  | `/list_items/:id`      | `list_items#update` |
| DELETE | `/list_items/:id`      | `list_items#destroy`|


## The Front End.
The Front End can be found here, https://github.com/BrianLM/smart-shop. The production site is at https://brianlm.github.io/smart-shop/index.html.

## ERD
![ERD](https://github.com/BrianLM/rails-project-api/blob/master/erdplus-diagram.png)
