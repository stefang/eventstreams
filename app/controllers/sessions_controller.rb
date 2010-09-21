class SessionsController < Clearance::SessionsController
  
  def create
    @user = User.authenticate(params[:session][:email],
                              params[:session][:password])
    if @user.nil?
      flash.now[:error] = t('sessions.login.failure')
      render :template => 'sessions/new', :status => :unauthorized
    else
      if @user.email_confirmed?
        sign_in(@user)
        remember(@user) if remember?
        flash[:notice] = t('sessions.login.success')
        redirect_back_or url_after_create
      else
        ClearanceMailer.deliver_confirmation(@user)
        deny_access(t('sessions.login.email_not_confirmed'))
      end
    end
  end
  
private

  def url_after_create
    user_events_path(current_user)
  end

  def url_after_destroy
    root_path
  end

end
