class ForestMailer < ActionMailer::Base
    
    def welcome_email(user, order)
        @order = order
        headers['X-MJ-CustomID'] = 'custom value'
        headers['X-MJ-EventPayload'] = 'custom payload'
    
        mail(
        from: "salimboumediene@gmail.com",
        to: "#{user}",
        subject: "This is order email"
        )
      end

  end