ActionController::Routing::Routes.draw do |map|

  map.resources :sessions, :only => [:new, :create, :destroy]

  # map.resources :users, :only => [:new, :create]

  map.resources :posts, :only => [:show, :index]

  # map.resources :tags

  map.root :controller => "posts"

  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'

end

