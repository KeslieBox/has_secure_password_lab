class UsersController < ApplicationController
    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/welcome/home'
        else  
            redirect_to '/users/new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
