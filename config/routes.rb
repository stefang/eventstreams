ActionController::Routing::Routes.draw do |map|

  map.resources :events, :only => [:index, :show]

  map.root :controller => 'static_pages', :action => 'front'
  map.resources :users

  map.resources :users do |u|
    u.resources :events, :only => [:new, :create, :edit, :update]
  end

end
