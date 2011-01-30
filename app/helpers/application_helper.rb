# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def is_owner?(owned_object)
    current_user == owned_object.user
  end
  
  def pluralize_no_number(count, singular, plural = nil)
     ((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
  end

  def pretty_time_ago(date, options={})
    options = {:prefix => '', :suffix => ' ago'}.merge options
    "#{options[:prefix]}#{time_ago_in_words(date)}#{options[:suffix]}"
  end
  
  def body_class
    body_class = controller.controller_name
    body_class += " #{controller.action_name}"
    body_class += " #{@event_page.cached_slug}" if @event_page
    return body_class
  end
  
  def asset_display(text)
    return text.gsub(/\[asset:([0-9]+)\]/) {|s| find_asset_url($1)}
  end
  
  def find_asset_url(asset_id)
    for asset in @event.owned_event_assets
      if asset.id == asset_id.to_i
        return image_tag(asset.asset.url)
      end 
    end
  end
end
