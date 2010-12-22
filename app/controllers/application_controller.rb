# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Clearance::Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  layout 'default'

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end

    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
  
  def must_be_superadmin
    unless signed_in?
      flash[:error] = t('sessions.flash.not_auth')
      return redirect_to_root 
    end
    raise ActionController::Forbidden unless current_user.superadmin?
  end
  
  def get_published_or_owned_event
    
    if signed_in? && current_user.superadmin?
      @event = Event.find_by_subdomain(current_subdomain, :order => 'start_date DESC', :limit => 1)
    elsif signed_in?
      @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true OR user_id = #{current_user.id}", :order => 'start_date DESC', :limit => 1)
    else
      @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true", :order => 'start_date DESC', :limit => 1)
    end
  end  
  
  # def create_event_menu_item item
  #   menu_item = @event.menu_order.new(:item_type => item.class.to_s, :item_id => item.id)
  #   menu_item.save
  # end
  
  # def update_event_menu_item item
  #   menu_item = @event.menu_order.find_by_item_type_and_item_id(item.class.to_s, item.id)
  #   menu_item.save
  # end
  
  def destroy_event_menu_item item
    menu_item = @event.menu_order_main.find_by_item_type_and_item_id(item.class.to_s, item.id)
    menu_item.destroy if menu_item
    menu_item = @event.menu_order_footer.find_by_item_type_and_item_id(item.class.to_s, item.id)
    menu_item.destroy if menu_item
  end
  
  def user_from_session
     if session[:user_id]
       return nil  unless user = ::User.find_by_id(session[:user_id])
       return user
     end
  end
end
