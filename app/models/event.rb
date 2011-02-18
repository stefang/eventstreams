class Event < ActiveRecord::Base
  
  belongs_to :user
  
  has_attached_file :logo, :styles => { :original => "980x980", :medium => "460x300>", :header => "580x100>", :tiny => "42x42#" }, 
    :path => ":rails_root/assets/event_assets/:id/event_logo/:id/:style/:id.jpg",
    :url => "/event_assets/:id/event_logo/:id/:style/:id.jpg",
    :convert_options => {
        :all => "-strip -colorspace RGB", 
        :header => "-quality 92" 
    }

  validates_presence_of :title

  validates_presence_of :subdomain
  #validates_uniqueness_of :subdomain
  
  validate :validate_subdomain
  
  validates_exclusion_of :subdomain, :in => %w(www about contact faq blog tour features packages tos privacy help support pricing careers assets staging edge),
      :message => "'%{value}' is reserved."
  
  validates_format_of :subdomain, :with => /^\w+$/i, :message => "must only contain letters and numbers"
  validates_format_of :hashtag, :with => /^#/i, :message => "requires a # at the start", :allow_blank => true
  validates_format_of :twitter_account, :with => /^@/i, :message => "should have an @ at the start", :allow_blank => true

  has_many :owned_event_pages, :class_name => 'EventPage', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'
  has_many :owned_links, :class_name => 'Link', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_speakers, :class_name => 'Speaker', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'
  has_many :owned_tracks, :class_name => 'Track', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'
  has_many :owned_talks, :class_name => 'Talk', :foreign_key => :event_id, :dependent => :destroy, :order => 'start ASC'
  has_many :owned_venues, :class_name => 'Venue', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_sponsors, :class_name => 'Sponsor', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'
  has_many :owned_venue_types, :class_name => 'VenueType', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_tweets, :class_name => 'Tweet', :foreign_key => :event_id, :dependent => :destroy, :order => 'created_at DESC'
  has_many :owned_event_assets, :class_name => 'EventAsset', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_news_items, :class_name => 'EventNewsItem', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_date DESC'
  has_many :menu_order_main, :class_name => 'EventMenu', :foreign_key => :event_id, :conditions=>{:location => 'main'}, :dependent => :destroy, :order => 'item_order'
  has_many :menu_order_footer, :class_name => 'EventMenu', :foreign_key => :event_id, :conditions=>{:location => 'footer'}, :dependent => :destroy, :order => 'item_order'

  has_many :published_event_pages, :class_name => 'EventPage', :foreign_key => :event_id, :conditions=>{:published => true}, :order => 'item_order'
  has_many :published_sponsors, :class_name => 'Sponsor', :foreign_key => :event_id, :conditions=>{:published => true, :sponsor_type => 'Sponsor'}, :order => 'item_order'
  has_many :published_partners, :class_name => 'Sponsor', :foreign_key => :event_id, :conditions=>{:published => true, :sponsor_type => 'Partner'}, :order => 'item_order'
  has_many :published_links, :class_name => 'Link', :foreign_key => :event_id, :conditions=>{:published => true}
  has_many :published_talks, :class_name => 'Talk', :foreign_key => :event_id, :conditions=>{:published => true}, :order => 'start'
  has_many :published_news_items, :class_name => 'EventNewsItem', :foreign_key => :event_id, :conditions=>{:published => true}, :order => 'item_date', :order => 'item_date DESC'
  
  attr_accessor :remove_logo
  before_save :perform_remove_logo
  
  def perform_remove_logo 
    self.logo = nil if self.remove_logo=="1" && !self.logo.dirty?
    true 
  end  
  
  serialize :colours
  
  def title_colour
    create_colours_if_empty
    if colours.has_key? :title_colour
      colours[:title_colour]
    else
      "#333333"
    end
  end

  def title_colour=(value)
    create_colours_if_empty
    self.colours[:title_colour] = value
  end

  def link_colour
    create_colours_if_empty
    if colours.has_key? :link_colour
      colours[:link_colour]
    else
      "#e16736"
    end
  end
  def link_colour=(value)
    create_colours_if_empty
    self.colours[:link_colour] = value
  end
  
  def theme_name
    create_colours_if_empty
    if colours.has_key? :theme_name
      colours[:theme_name]
    else
      "paper"
    end
  end
  def theme_name=(value)
    create_colours_if_empty
    self.colours[:theme_name] = value
  end
   
  def create_colours_if_empty
    if self.colours.blank?
      self.colours = {} 
    end
  end

  def display_date
    if start_date && end_date
      if start_date < end_date
        range = start_date .. end_date
        range.to_s(:condensed)
      else
        start_date.to_s(:dmy_long)
      end
    else
      start_date.to_s(:dmy_long) if start_date
    end
  end
  
  def display_date_full
    if start_date && end_date
      "#{start_date.to_date.to_s(:long_ordinal)} to the #{end_date.to_date.to_s(:long_ordinal)}"
    elsif start_date
      "#{start_date.to_date.to_s(:long_ordinal)}"
    end
  end
  
  def browser_title
    if tagline
      "#{title} | #{tagline}"
    else
      title
    end
  end
  
  def serialized_attr_accessor
    return true
  end
  
  def validate_subdomain
    if Event.count(:conditions => ["subdomain = ? and user_id != ?", subdomain, user_id]) > 0
      errors.add_to_base("Someone has already bagged this subdomain, sorry!")
    end
  end
  
end