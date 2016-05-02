require 'test_helper'

module Booqcms
  class EntriesControllerTest < ActionController::TestCase
    include Engine.routes.url_helpers
    setup do
      @routes = Engine.routes
      @controller = Booqcms::EntriesController.new
      @user = booqcms_users(:two)
    end

    test "should get index after signin" do
      sign_in @user
      get :index
      assert_response :success
      assert_not_nil assigns(:entries)
    end

    test "should redirect to login if not signed in" do
      get :index
      assert_response :redirect
    end

    test "the preview method should get the entry" do
      @entry = booqcms_entries(:one)
      sign_in @user
      xhr :get, :preview, :format => :js,  :entry_id => @entry.id
      assert_response :success
    end

    test "the multiple delete action should delete the selected entries" do
      params = {entry_ids: [booqcms_entries(:entry_2).id, booqcms_entries(:entry_3).id, booqcms_entries(:entry_5).id]}
      sign_in @user
      delete :destroy_multiple, params
      assert_response :redirect
    end

  end
end
