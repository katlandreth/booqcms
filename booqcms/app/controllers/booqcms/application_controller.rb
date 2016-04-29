module Booqcms
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    protect_from_forgery with: :exception

    # def current_user
    #   unless defined?(@current_user)
    #     @current_user = instance_eval(&Booqcms.configuration.current_user_lookup)
    #   end
    #   @current_user
    # end
    # helper_method :current_user

    # def authenticate_user
    #   return if current_user
    #
    #   redirect_to instance_eval(&Booqcms.configuration.sign_in_url)
    # end

  
  def content_entries_path
   entries_path
  end
  helper_method :content_entries_path

  def content_entry_path(entry)
    entry_path(entry)
  end
  helper_method :content_entry_path
  end
end
