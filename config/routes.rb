# frozen_string_literal: true

Rails.application.routes.draw do
  resources :list_items, except: %i[index new edit]
  resources :lists, except: %i[new edit]
  resources :items, only: %i[show create index]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: %i[index show]

  match 'search_items/:id' => 'items#search',
        :constraints => { id: /[0-z\.]+/ }, :via => [:get]
  # match 'invite/:id' => 'users#showemail',
  #       :constraints => { id: /[0-z\.]+/ }, :via => [:get]
  # get '/members/:id' => 'group_memberships#showmembers'
  # post '/new_list' => 'lists#listwitems'
  # post '/myitems' => 'items#indexuser'
  # post '/mystores' => 'stores#indexuser'
  # resources :prices, except: %i[new edit]
  # resources :purchases, except: %i[new edit]
  # resources :stores, except: %i[new edit]
  # resources :group_memberships, except: %i[new edit update]
  # resources :groups, except: %i[new edit]
  # resources :examples, except: %i[new edit]
end
