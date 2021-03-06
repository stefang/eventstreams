ActionController::Routing::Routes.draw do |map|

  map.resources :invites, :conditions => { :subdomain => nil }

  # Event Show Routes

  map.event_root '', :controller => 'events', :action => 'show', :conditions => { :subdomain => /.+/ }
  map.event_stylesheet 'custom_stylesheets/custom.css', :controller => 'events', :action => 'custom', :conditions => { :subdomain => /.+/ }
  map.resources :speakers, :only => [:index, :show], :conditions => { :subdomain => /.+/ }
  map.resources :sponsors, :only => [:index], :conditions => { :subdomain => /.+/ }
  map.resources :tracks, :as => 'programme', :only => [:index, :show], :conditions => { :subdomain => /.+/ }
  map.resources :talks, :only => [:index, :show], :conditions => { :subdomain => /.+/ } do |t|
    t.resources :videos, :only => [:show], :conditions => { :subdomain => /.+/ }
  end
  map.resources :venues, :as => 'location', :only => [:index, :show], :conditions => { :subdomain => /.+/ }
  map.resources :tweets, :only => [:index, :show], :conditions => { :subdomain => /.+/ }
  map.resources :sponsors, :only => [:index], :conditions => { :subdomain => /.+/ }
  map.resources :event_news_items, :as => 'news', :only => [:index, :show], :conditions => { :subdomain => /.+/ }
  

  map.with_options :controller => 'event_contact' do |c|
    c.contact '/contact',
      :action => 'index', 
      :conditions => { :method => :get, :subdomain => /.+/ }

    c.contact '/contact',
      :action => 'create', 
      :conditions => { :method => :post, :subdomain => /.+/ }
  end
  
  map.with_options :controller => 'support_email' do |c|
    c.contact '/contact',
      :action => 'index', 
      :conditions => { :method => :get, :subdomain => nil }

    c.contact '/contact',
      :action => 'create', 
      :conditions => { :method => :post, :subdomain => nil }
  end
  
  map.event_page '/:id', :controller => 'event_pages', :action=>'show', :conditions => { :subdomain => /.+/ }

  # Main Site Routes

  map.resources :events, :only => [:index]

  map.root :controller => 'static_pages', :action => 'holding'
  map.resources :users

  map.resources :users do |u|
    u.resources :events do |e|
      e.resources :venues, :as => 'location'
      e.resources :venue_types, :except => [:index]      
      e.resources :event_pages
      e.resources :sponsors
      e.resources :links
      e.resources :tracks
      e.resources :speakers
      e.resources :event_assets
      e.resources :event_news_items
      e.resources :talks do |t|
        t.resources :videos
      end
      e.resources :tweets
      e.resources :event_menus
    end
    u.resource :confirmation, :controller => 'clearance/confirmations'
  end
  
  map.connect 'users/:user_id/events/:event_id/event_menus/update_order', :controller => 'event_menus', :action=>'update_order', :conditions => { :method => :post }
  map.connect 'users/:user_id/events/:event_id/speakers/update_order', :controller => 'speakers', :action=>'update_order', :conditions => { :method => :post }
  map.connect 'users/:user_id/events/:event_id/tracks/update_order', :controller => 'tracks', :action=>'update_order', :conditions => { :method => :post }
  map.connect 'users/:user_id/events/:event_id/sponsors/update_order', :controller => 'sponsors', :action=>'update_order', :conditions => { :method => :post }

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