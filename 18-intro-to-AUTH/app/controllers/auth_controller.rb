class AuthController < ApplicationController
    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])

            token = encode({user_id: user.id})
            render json: {
                authenticated: true,
                message: "user logged in",
                token: token,
                user: user
            }, status: :accepted
        else
            render json: {
                authenticated: false,
                message: "ACCESS_DENIED"
            }, status: :unauthorized
        end
    end
end
