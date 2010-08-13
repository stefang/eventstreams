require 'test_helper'

class TalksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Talk.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Talk.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Talk.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to talk_url(assigns(:talk))
  end
  
  def test_edit
    get :edit, :id => Talk.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Talk.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Talk.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Talk.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Talk.first
    assert_redirected_to talk_url(assigns(:talk))
  end
  
  def test_destroy
    talk = Talk.first
    delete :destroy, :id => talk
    assert_redirected_to talks_url
    assert !Talk.exists?(talk.id)
  end
end
