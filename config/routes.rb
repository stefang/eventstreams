ActionController::Routing::Routes.draw do |map|
  map.resources :invites, :conditions => { :subdomain => nil }


  # Event Show Routes

  map.event_root '', :controller => 'events', :action => 'show', :conditions => { :subdomain => /.+/ }
  map.resources :speakers, :only => [:index, :show], :conditions => { :subdomain => /.+/ }
  map.resources :tracks, :only => [:index, :show], :conditions => { :subdomain => /.+/ }
  map.resources :talks, :only => [:index, :show], :conditions => { :subdomain => /.+/ } do |t|
    t.resources :videos, :only => [:show], :conditions => { :subdomain => /.+/ }
  end
  map.resources :venues, :only => [:index, :show], :conditions => { :subdomain => /.+/ }
  map.resources :tweets, :only => [:index, :show], :conditions => { :subdomain => /.+/ }

  map.event_page '/:id', :controller => 'event_pages', :action=>'show', :conditions => { :subdomain => /.+/ }

  # Main Site Routes

  map.resources :events, :only => [:index]

  map.root :controller => 'static_pages', :action => 'holding'
  map.resources :users

  map.resources :users do |u|
    u.resources :events do |e|
      e.resources :venues
      e.resources :venue_types, :except => [:index]      
      e.resources :event_pages
      e.resources :tracks
      e.resources :speakers
      e.resources :talks do |t|
        t.resources :videos
      end
      e.resources :tweets
    end
    u.resource :confirmation, :controller => 'clearance/confirmations'
  end
  
  map.connect 'users/:user_id/events/:event_id/event_pages/update_order', :controller => 'event_pages', :action=>'update_order', :conditions => { :method => :post }

  map.resource    :session,
                  :controller => 'sessions',
                  :only       => [:new, :create, :destroy]
                  
  map.sign_out 'sign_out',
      :controller => 'sessions',
      :action     => 'destroy',
      :method     => :delete

  map.resource :passwords, :controller => 'clearance/passwords'

  map.send_invitation '/send_invitation/:id', :controller => "invites", :action => "send_invitation"
  map.redeem_invitation '/signup/:invite_code', :controller => 'users', :action => 'new'

end