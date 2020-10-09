class SessionsController < ApplicationController

    def new
        @users = User.all
    end

    def create
        user = User.find_by(name: params[:user_name])
        user = user.try(:authenticate, params[:user_password])
        
        return redirect_to "/signin" unless user
        
        session[:user_id] = user.id

        redirect_to user_path(user)

    end

    def destroy
        session.delete :user_id
        redirect_to "/"
    end
    
end
