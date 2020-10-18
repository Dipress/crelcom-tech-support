module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorized, except: [:login]

      def login
        @user = User.find_by(login: params[:login])
        if @user && @user.authenticate(@user.pswd, params[:password])
          token = encode_token({user_id: @user.id, password: params[:password]})
          render json: {token: token}
        else
          render json: {error: "Invalid username or password"}
        end
      end

      def info
        render json: {user: current_user}
      end

      private

        # def user_params
        #   params.permit(:login, :password)
        # end
    end
  end
end
