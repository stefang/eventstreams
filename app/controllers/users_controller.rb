class UsersController < Clearance::UsersController
  
  before_filter :authenticate, :only => [:show, :edit, :update]
  
  def show
    render :layout => 'admin'
  end
  
end