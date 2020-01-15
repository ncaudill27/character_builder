class UsersController < ApplicationController

    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        unless params[:user].values.any?("")
            user = User.create(params[:user])
            redirect "/login"
        else
            redirect "/signup"
        end
    end

    get "/users" do
        @users = User.all

        erb :"/users/index"
    end

    get "/:username" do
        @user = User.find_by(username: params[:username])

        erb :"users/show"
    end

    get "/:username/edit" do
        @user = User.find_by(username: params[:username])

        if logged_in? && current_user.username == @user.username
            erb :"users/edit"
        else
            redirect "/login"
        end
    end

    patch "/:username" do
        user = User.find_by(username: params[:username])
        user.username = params[:user][:username]
        user.email = params[:user][:email]
        user.save
        
        redirect "/#{user.username}"
    end

    delete "/:username" do
        user = User.find_by(username: params[:username])
        #TODO Add security check
        user.destroy

        redirect "/users"
    end
end