class UsersController < Clearance::UsersController
  
  before_filter :getuser, :only => [:show, :edit, :update]
  before_filter :authenticate
  
  def create
    @user = ::User.new params[:user]
    @user.superadmin = false
    invite_code = params[:invite_code]
    @invite = Invite.find_redeemable(invite_code)
    if invite_code && @invite
      if @user.save
        @invite.redeemed!
        ::ClearanceMailer.deliver_confirmation @user
        flash[:notice] = t('flash.users.notice.signed_up')
        redirect_to url_after_create
      else
        render :controller=>'users', :action => 'new'
      end
    else
      flash.now[:notice] = "Sorry, you need an invite to sign up"
      render :action => 'new'
    end
  end

  def new
    @user = User.new
    @invite = Invite.find_by_invite_code(params[:invite_code]) if params[:invite_code]
    @user.email = @invite.email unless @invite.blank?
    if @invite.blank?
      flash[:notice] = "Sorry, you need an invite to sign up"
      redirect_to root_path
    end
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