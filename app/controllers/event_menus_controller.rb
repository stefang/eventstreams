class EventMenusController < ApplicationController

  before_filter :authenticate

  def index
    @event = current_user.owned_events.find(params[:event_id])
    @event_menus =  @event.menu_order.all
    @active_items = []
    @event_menus.each do |i|
      if i.item_type == 'StaticItem'
        @active_items << "#{i.item_type.tableize}_#{i.title.downcase}"
      else
        @active_items << "#{i.item_type.tableize}_#{i.item_id}"
      end
    end  
    logger.debug @active_items
  end
  
  def update_order
    @event = current_user.owned_events.find(params[:event_id])
    @event.menu_order.destroy_all
    current_item = 1
    item_order = params[:item_order].split("&")
    item_order.each do |e|
      item_data = e.split("[]=")
      if item_data[0] != 'static_item'
        record = item_data[0].camelize.constantize.find(item_data[1])
        item = @event.menu_order.new()
        item.title = record.title
        item.item_type = record.class.to_s
        item.item_id = record.id
        item.item_order = current_item
        if item.item_type == 'Link'
          item.url = record.url
        else
          item.url = url_for :controller => item.item_type.tableize, :action => 'show', :id => record.cached_slug, :only_path => true
        end
        item.save
        current_item += 1
      else
        item = @event.menu_order.new()
        item.title = item_data[1].titlecase
        item.url = case item_data[1]
          when "location" then "/location"
          when "contact" then "/contact"
          when "speakers" then "/speakers"
          when "programme" then "/programme"
          when "sponsors" then "/sponsors"
        end
        item.item_type = item_data[0].camelize
        item.item_id = 0
        item.item_order = current_item
        item.save
        current_item += 1
      end
    end
    render :text => "Menu order saved"
  end
  
    
end
