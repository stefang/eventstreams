class UsersController < Clearance::UsersController
  
  before_filter :getuser, :only => [:show, :edit, :update]
  before_filter :authenticate, :only => [:index, :show, :edit, :update]
  
  def create
    @user = ::User.new params[:user]
    @user.superadmin = false
    if @user.save
      ::ClearanceMailer.deliver_confirmation @user
      flash[:notice] = t('flash.users.notice.signed_up')
      redirect_to url_after_create
    else
      render :controller=>'users', :action => 'new'
    end
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    if current_user.id != params[:id].to_i
      flash[:notice] = "Sorry, you can only see your own profile"
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(current_user)
    if params[:id].to_i != current_user.id.to_i
      redirect_to edit_user_path(current_user)
    end
  end
  
  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def getuser
    @user = User.find(params[:id])
  end
  
end