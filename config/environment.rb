# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.gmail.com',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'icalendar.test001@gmail.com',
  :password       => 'sendgridtest',
  :domain         => 'gmail.com',
  :enable_starttls_auto => true
  }
 