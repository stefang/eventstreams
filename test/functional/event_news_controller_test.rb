require 'test_helper'

class EventNewsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => EventNews.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    EventNews.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    EventNews.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to event_news_url(assigns(:event_news))
  end
  
  def test_edit
    get :edit, :id => EventNews.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    EventNews.any_instance.stubs(:valid?).returns(false)
    put :update, :id => EventNews.first
    assert_template 'edit'
  end

  def test_update_valid
    EventNews.any_instance.stubs(:valid?).returns(true)
    put :update, :id => EventNews.first
    assert_redirected_to event_news_url(assigns(:event_news))
  end
  
  def test_destroy
    event_news = EventNews.first
    delete :destroy, :id => event_news
    assert_redirected_to event_news_url
    assert !EventNews.exists?(event_news.id)
  end
end
