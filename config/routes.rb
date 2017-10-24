# frozen_string_literal: true

Rails.application.routes.draw do
  resources :list_items, except: %i[index new edit]
  resources :lists, except: %i[new edit]
  resources :items, except: %i[destory new edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: %i[index show]

  match 'search_items/:id' => 'items#search',
        :constraints => { id: /[0-z\.]+/ }, :via => [:get]
  # resources :groups, except: %i[new edit]
  # get '/members/:id' => 'group_memberships#showmembers'
  # resources :group_memberships, except: %i[new edit update]
  # match 'invite/:id' => 'users#showemail',
  #       :constraints => { id: /[0-z\.]+/ }, :via => [:get]
  # post '/new_list' => 'lists#listwitems'
  # post '/mystores' => 'stores#indexuser'
  # resources :stores, except: %i[new edit]
  # resources :prices, except: %i[new edit]
  # resources :purchases, except: %i[new edit]
  # resources :examples, except: %i[new edit]
end
