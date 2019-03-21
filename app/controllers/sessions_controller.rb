class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by_email(params[:email])
        #If user exists and password is good
        if user && user.authenticate(params[:password])
            #Save user inside browser cookie
        session[:user_id] = user.id
        redirect_to '/'
        else
        #if user dosent work
        redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/login'
    end

end