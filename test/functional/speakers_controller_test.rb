require 'test_helper'

class SpeakersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Speaker.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Speaker.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Speaker.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to speaker_url(assigns(:speaker))
  end
  
  def test_edit
    get :edit, :id => Speaker.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Speaker.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Speaker.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Speaker.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Speaker.first
    assert_redirected_to speaker_url(assigns(:speaker))
  end
  
  def test_destroy
    speaker = Speaker.first
    delete :destroy, :id => speaker
    assert_redirected_to speakers_url
    assert !Speaker.exists?(speaker.id)
  end
end
