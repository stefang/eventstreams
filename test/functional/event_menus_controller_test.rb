require 'test_helper'

class EventMenusControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => EventMenu.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    EventMenu.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    EventMenu.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to event_menu_url(assigns(:event_menu))
  end
  
  def test_edit
    get :edit, :id => EventMenu.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    EventMenu.any_instance.stubs(:valid?).returns(false)
    put :update, :id => EventMenu.first
    assert_template 'edit'
  end
  
  def test_update_valid
    EventMenu.any_instance.stubs(:valid?).returns(true)
    put :update, :id => EventMenu.first
    assert_redirected_to event_menu_url(assigns(:event_menu))
  end
  
  def test_destroy
    event_menu = EventMenu.first
    delete :destroy, :id => event_menu
    assert_redirected_to event_menus_url
    assert !EventMenu.exists?(event_menu.id)
  end
end
