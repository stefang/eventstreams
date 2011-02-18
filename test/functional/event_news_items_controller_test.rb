require 'test_helper'

class EventNewsItemsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => EventNewsItem.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    EventNewsItem.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    EventNewsItem.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to event_news_item_url(assigns(:event_news_item))
  end
  
  def test_edit
    get :edit, :id => EventNewsItem.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    EventNewsItem.any_instance.stubs(:valid?).returns(false)
    put :update, :id => EventNewsItem.first
    assert_template 'edit'
  end

  def test_update_valid
    EventNewsItem.any_instance.stubs(:valid?).returns(true)
    put :update, :id => EventNewsItem.first
    assert_redirected_to event_news_item_url(assigns(:event_news_item))
  end
  
  def test_destroy
    event_news_item = EventNewsItem.first
    delete :destroy, :id => event_news_item
    assert_redirected_to event_news_items_url
    assert !EventNewsItem.exists?(event_news_item.id)
  end
end
