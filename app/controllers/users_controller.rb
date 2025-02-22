class UsersController < ApplicationController
    def new
    end

    def create
        user = User.create(user_params)
        if params[:user][:password] == params[:user][:password_confirmation]
            session[:user_id] = user.id
        else
            redirect_to :signup
        end
    end
     
private
     
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
