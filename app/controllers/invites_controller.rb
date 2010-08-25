class InvitesController < ApplicationController
  
  before_filter :authenticate
  before_filter :must_be_superadmin
  
  def index
    @invites = Invite.all
  end
  
  def new
    @invite = Invite.new
  end
  
  def create
    @invite = Invite.new(params[:invite])
    if @invite.save
      flash[:notice] = "Successfully created invite."
      redirect_to invites_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @invite = Invite.find(params[:id])
  end
  
  def update
    @invite = Invite.find(params[:id])
    if @invite.update_attributes(params[:invite])
      flash[:notice] = "Successfully updated invite."
      redirect_to invites_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy
    flash[:notice] = "Successfully destroyed invite."
    redirect_to invites_url
  end
  
  def send_invitation
    @invite = Invite.find(params[:id])
    @invite.invite!
    Notification.deliver_invitation(@invite)
    flash[:notice] = "Invite sent to #{@invite.email}"
    redirect_to(invites_url)
  end
  
end
