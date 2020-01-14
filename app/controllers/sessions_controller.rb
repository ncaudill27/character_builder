class SessionsController < ApplicationController

    get "/login" do        
        erb :"sessions/login"
    end

    post "/login" do
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:email] = user.email

            redirect "/#{current_user.username}"
        else
            redirect "/login"
        end
    end

    get "/logout" do
        session.clear

        redirect "/"
    end
end