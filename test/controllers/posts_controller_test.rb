require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get(:show, {'id' => posts(:published).id})
    assert_response :success
  end

end
