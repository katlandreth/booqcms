module Dashboard
  class ApplicationController < ActionController::Base
    before_filter :auth_user


    protect_from_forgery with: :exception

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

private

def auth_user
  redirect_to new_user_registration_url unless user_signed_in?
end
