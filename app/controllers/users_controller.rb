class UsersController < Clearance::UsersController
  
  before_filter :authenticate, :only => [:show, :edit, :update]

  def show
  end
end