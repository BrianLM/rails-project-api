# frozen_string_literal: true

Rails.application.routes.draw do
  resources :purchases, except: %i[new edit]
  resources :prices, except: %i[new edit]
  resources :list_items, except: %i[index new edit]
  resources :stores, except: %i[new edit]
  resources :group_memberships, except: %i[new edit update]
  resources :groups, except: %i[new edit]
  resources :lists, except: %i[new edit]
  resources :items, except: %i[new edit]
  resources :examples, except: %i[new edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: %i[index show]

  post '/new_list' => 'lists#listwitems'
  post '/myitems' => 'items#indexuser'
  get '/members/:id' => 'group_memberships#showmembers'
  post '/mystores' => 'stores#indexuser'
  match 'invite/:id' => 'users#showemail',
        :constraints => { id: /[0-z\.]+/ }, :via => [:get]
end
