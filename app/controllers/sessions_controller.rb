class SessionsController < ApplicationController

    get "/login" do        
        erb :"sessions/login"
    end

    post "/login" do
        user = User.find_by(email: params[:user][:email])
        session[:email] = user.email

        redirect "/#{current_user.username}"
    end

    get "/logout" do
        session.clear
    end
end