ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'static_pages', :action => 'front'
  map.resources :users
end
