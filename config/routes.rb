ActionController::Routing::Routes.draw do |map|

  # Event Show Routes

  map.event_root '', :controller => 'events', :action => 'show', :conditions => { :subdomain => /.+/ }
  map.resources :tracks, :only => [:index, :show], :conditions => { :subdomain => /.+/ }
  map.resources :talks, :only => [:index, :show], :conditions => { :subdomain => /.+/ }
  map.resources :venues, :only => [:index, :show], :conditions => { :subdomain => /.+/ }

  map.event_page '/:id', :controller => 'event_pages', :action=>'show', :conditions => { :subdomain => /.+/ }

  # Main Site Routes

  map.resources :events, :only => [:index]

  map.root :controller => 'static_pages', :action => 'front'
  map.resources :users

  map.resources :users do |u|
    u.resources :events do |e|
      e.resources :venues
      e.resources :venue_types      
      e.resources :event_pages
      e.resources :tracks
      e.resources :talks do |t|
        t.resources :speakers
      end
    end
  end

end