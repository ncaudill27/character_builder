class UsersController < ApplicationController

    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        user = User.create(params[:user])

        redirect "/login"
    end

    get "/:username" do
        @user = User.find_by(username: params[:username])

        erb :"users/show"
    end
end