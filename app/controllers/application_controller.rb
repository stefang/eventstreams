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
      @event = Event.find_by_subdomain(current_subdomain)
    elsif signed_in?
      @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true OR user_id = #{current_user.id}")
    else
      @event = Event.find_by_subdomain(current_subdomain, :conditions => "published = true")
    end
  end
end
