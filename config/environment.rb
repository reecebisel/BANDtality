# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => 25,
  :domain => "www.devpointlabs.com",
  :authentication => :plain,
  :user_name => ENV["user_name"],
  :password => ENV["password"]
}

