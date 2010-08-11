ActionController::Routing::Routes.draw do |map|
  
  map.event_root '', :controller => 'events', :action => 'show', :conditions => { :subdomain => /.+/ }
  map.event_page '/:id', :controller => 'event_pages', :action=>'show', :conditions => { :subdomain => /.+/ }
  map.resources :events, :only => [:index]

  map.root :controller => 'static_pages', :action => 'front'
  map.resources :users

  map.resources :users do |u|
    u.resources :events, :only => [:show, :new, :create, :edit, :update, :destroy] do |e|
      e.resources :event_pages
    end
  end

end