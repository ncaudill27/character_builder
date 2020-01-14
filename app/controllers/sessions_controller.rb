class SessionsController < ApplicationController

    get "/login" do        
        erb :"sessions/login"
    end

    post "/login" do
        "#{params[:user]}"
    end
end