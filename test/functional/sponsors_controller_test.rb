require 'test_helper'

class SponsorsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Sponsor.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Sponsor.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Sponsor.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to sponsor_url(assigns(:sponsor))
  end
  
  def test_edit
    get :edit, :id => Sponsor.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Sponsor.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Sponsor.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Sponsor.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Sponsor.first
    assert_redirected_to sponsor_url(assigns(:sponsor))
  end
  
  def test_destroy
    sponsor = Sponsor.first
    delete :destroy, :id => sponsor
    assert_redirected_to sponsors_url
    assert !Sponsor.exists?(sponsor.id)
  end
end
