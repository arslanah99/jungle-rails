
class UserMailer < ApplicationMailer
   
    def confirmation_email(user, order)
      @user = user
      @order = order
      @url  = 'no-reply@jungle.com'
      mail(to: @user.email, subject:"Order # #{@order.id}")
    end
  end