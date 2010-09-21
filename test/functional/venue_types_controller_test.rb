require 'test_helper'

class VenueTypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => VenueType.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    VenueType.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    VenueType.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to venue_type_url(assigns(:venue_type))
  end
  
  def test_edit
    get :edit, :id => VenueType.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    VenueType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => VenueType.first
    assert_template 'edit'
  end
  
  def test_update_valid
    VenueType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => VenueType.first
    assert_redirected_to venue_type_url(assigns(:venue_type))
  end
  
  def test_destroy
    venue_type = VenueType.first
    delete :destroy, :id => venue_type
    assert_redirected_to venue_types_url
    assert !VenueType.exists?(venue_type.id)
  end
end
