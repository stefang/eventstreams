Clearance::Authentication::InstanceMethods.module_eval do
  def remember(user)
    user.remember_me!
    cookies[:remember_token] = { :value   => user.token,
                                 :expires => user.token_expires_at,
                                 :domain => COOKIE_DOMAIN }
  end

  def forget(user)
    user.forget_me! if user
    cookies.delete(:remember_token, :domain => COOKIE_DOMAIN)
    reset_session
  end
end