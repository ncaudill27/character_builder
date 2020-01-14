class SessionsController < ApplicationController

    get "/login" do        
        erb :"sessions/login"
    end

    post "/login" do
        user = User.find_by(email: params[:user][:email])
        #TODO Add security
        redirect "/#{user.username}"
    end
end