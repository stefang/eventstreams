class SupportEmailController < ApplicationController
  def index
  end
  
  def create
    if params[:message].blank? || params[:name].blank? || params[:email].blank?
      flash.now[:error] = "You must provide a name, email address and a message."
      render :action => :index      
    else
      if Notification.deliver_support_email(params)
        flash[:notice] = "Email was successfully sent."
        redirect_to(contact_path)
      else
        flash.now[:error] = "An error occurred while sending this email."
        render :action => :index    
      end
    end
  end  
end
