require 'test_helper'

module Booqcms
  class EntriesControllerTest < ActionController::TestCase
    include Engine.routes.url_helpers
    include Devise::TestHelpers
    setup do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @routes = Engine.routes
      @controller = Booqcms::EntriesController.new
    end

    test "should get index" do
      get :index
      assert_response :success
      # assert_not_nil assigns(:entries)
    end
  end
end
