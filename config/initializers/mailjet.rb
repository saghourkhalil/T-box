Mailjet.configure do |config|
    config.api_key = "#{Rails.application.credentials.api_mail_key}"
    config.secret_key = "#{Rails.application.credentials.api_mail_secret_mail}"
    config.default_from = 'salimboumediene@gmail.com.com'
  end
   