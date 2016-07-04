require 'test_helper'

module Dashboard
  class MediaControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
      @user = dashboard_users(:two)
      @upload = Medium.new
      @uploads = {test_uploads: [dashboard_media(:media_1), dashboard_media(:media_2), dashboard_media(:media_3)]}
    end

    test "should get index after signin" do
      sign_in @user
      get :index, @uploads
      assert_response :success
      assert_not_nil assigns(:uploads)
    end

    test "should redirect to login if not signed in" do
      get :index
      assert_response :redirect
    end

    test "the multiple delete action should delete the selected entries" do
      params = {medium_ids: [dashboard_media(:media_2).id, dashboard_media(:media_3).id, dashboard_media(:media_5).id]}
      sign_in @user
      delete :destroy_multiple, params
      assert_response :redirect
    end
  end
end
