require 'test_helper'

class InvitesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Invite.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Invite.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Invite.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to invite_url(assigns(:invite))
  end
  
  def test_edit
    get :edit, :id => Invite.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Invite.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Invite.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Invite.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Invite.first
    assert_redirected_to invite_url(assigns(:invite))
  end
  
  def test_destroy
    invite = Invite.first
    delete :destroy, :id => invite
    assert_redirected_to invites_url
    assert !Invite.exists?(invite.id)
  end
end
