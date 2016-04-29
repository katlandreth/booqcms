Booqcms.configure do |config|
  config.content_classes = %w(BlogPost Marketing)

  # config.current_user_lookup do
  #   env['warden'].user
  # end
  #
  # config.sign_in_url do
  #   Rails.application.routes.url_helpers.new_user_session_path
  # end

  Rails.backtrace_cleaner.add_silencer { |line| line =~ /rbenv/ }
end
