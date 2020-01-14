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

    get "/:username/edit" do
        @user = User.find_by(username: params[:username])
        
        erb :"users/edit"
    end

    patch "/:username" do
        user = User.find_by(username: params[:username])
        user.username = params[:user][:username]
        user.email = params[:user][:email]
        user.save

        redirect "/#{user.username}"
    end
end