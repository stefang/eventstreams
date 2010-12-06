class EventMenusController < ApplicationController

  before_filter :authenticate

  def index
    @event = current_user.owned_events.find(params[:event_id])
    @event_menus_main =  @event.menu_order_main.all
    @event_menus_footer = @event.menu_order_footer.all
    @active_items = []
    unless @event_menus_main.blank?
      @event_menus_main.each do |i|
        if i.item_type == 'StaticItem'
          @active_items << "#{i.item_type.tableize}_#{i.title.downcase}"
        else
          @active_items << "#{i.item_type.tableize}_#{i.item_id}"
        end
      end  
    end
    
    unless @event_menus_footer.blank?
      @event_menus_footer.each do |i|
        if i.item_type == 'StaticItem'
          @active_items << "#{i.item_type.tableize}_#{i.title.downcase}"
        else
          @active_items << "#{i.item_type.tableize}_#{i.item_id}"
        end
      end  
    end
  end
  
  def update_order
    @event = current_user.owned_events.find(params[:event_id])
    current_item = 1
    location = params[:menu_location]
    if location == 'main'
      @event.menu_order_main.destroy_all
    else
      @event.menu_order_footer.destroy_all
    end
    item_order = params[:item_order].split("&")
    item_order.each do |e|
      item_data = e.split("[]=")
      if location == 'main'
        item = @event.menu_order_main.new()
      else
        item = @event.menu_order_footer.new()
      end
      item.location = location
      item.item_order = current_item
      if item_data[0] != 'static_item'
        record = item_data[0].camelize.constantize.find(item_data[1])
        item.title = record.title
        item.item_type = record.class.to_s
        item.item_id = record.id
        if item.item_type == 'Link'
          item.url = record.url
        else
          item.url = url_for :controller => item.item_type.tableize, :action => 'show', :id => record.cached_slug, :only_path => true
        end
        item.save
        current_item += 1
      else
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
        item.save
        current_item += 1
      end
    end
    render :text => "Menu order saved"
  end
  
    
end
