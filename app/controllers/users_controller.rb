class UsersController < ApplicationController


    def new
    end

    def create
        user = User.new(user_params)
        if user.save
          session[:user_id] = user.id
          redirect_to '/'
        else
          redirect_to '/users/new'
        end
    end
    def user_params
        params.require(:user).permit(:email, :password, :firstname, :lastname)
      end

end