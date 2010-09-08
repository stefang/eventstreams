class Event < ActiveRecord::Base
  
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :subdomain
  validates_uniqueness_of :subdomain
  validates_format_of :hashtag, :with => /^#/i, :on => :create, :message => "requires a # at the start", :allow_blank => true

  has_many :owned_event_pages, :class_name => 'EventPage', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'
  has_many :owned_speakers, :class_name => 'Speaker', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'
  has_many :owned_tracks, :class_name => 'Track', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'
  has_many :owned_talks, :class_name => 'Talk', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_venues, :class_name => 'Venue', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_venue_types, :class_name => 'VenueType', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_tweets, :class_name => 'Tweet', :foreign_key => :event_id, :dependent => :destroy

  has_many :published_event_pages, :class_name => 'EventPage', :foreign_key => :event_id, :dependent => :destroy, :conditions=>{:published => true}, :order => 'item_order'
  
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
      "#2687A3"
    end
  end
  def link_colour=(value)
    create_colours_if_empty
    self.colours[:link_colour] = value
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
  
  def valid_hashtag?
    errors.add(:hashtag, "requires a # at the start") unless hashtag.starts_with? "#"
  end
  
  def serialized_attr_accessor
    return true
  end
  
end