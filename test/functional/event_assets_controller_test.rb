require 'test_helper'

class EventAssetsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => EventAsset.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    EventAsset.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    EventAsset.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to event_asset_url(assigns(:event_asset))
  end
  
  def test_edit
    get :edit, :id => EventAsset.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    EventAsset.any_instance.stubs(:valid?).returns(false)
    put :update, :id => EventAsset.first
    assert_template 'edit'
  end

  def test_update_valid
    EventAsset.any_instance.stubs(:valid?).returns(true)
    put :update, :id => EventAsset.first
    assert_redirected_to event_asset_url(assigns(:event_asset))
  end
  
  def test_destroy
    event_asset = EventAsset.first
    delete :destroy, :id => event_asset
    assert_redirected_to event_assets_url
    assert !EventAsset.exists?(event_asset.id)
  end
end
