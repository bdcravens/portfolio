# https://github.com/plataformatec/devise/wiki/How-To:-Use-custom-mailer

class CustomerDeviseMailer < Devise::Mailer   
  # include DefaultUrlOptions
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views
  default from: "#{ENV['SITE_NAME']} <#{ENV['SITE_FROM_EMAIL']}>"
  default reply_to: "#{ENV['SITE_NAME']} <#{ENV['SITE_FROM_EMAIL']}>"
end