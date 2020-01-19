class UsersController < ApplicationController

    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        user = User.new
        user.username = params[:user][:username]
        user.email = params[:user][:email]
        user.password = params[:user][:password]
        user.save

        if user.id
            session[:email] = user.email

            redirect "/#{current_user.username}"
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

    get "/:username/edit/password" do
        @user = User.find_by(username: params[:username])

        erb  :"users/password"
    end

    patch "/:username" do
        user = User.find_by(username: params[:username])
        user.username = params[:user][:username]
        user.email = params[:user][:email]
        user.save
        
        redirect "/#{user.username}"
    end

    put "/:username/password" do
        user = User.find_by(username: params[:username])        
        if current_user.authenticate(params[:password][:current]) && params[:password][:new] == params[:password][:confirm]

            current_user.update(password: params[:password][:new])
            redirect "/#{current_user.username}"
        else

            
        end

    end

    delete "/:username" do
        user = User.find_by(username: params[:username])
        if logged_in? && current_user.username == @user.username
            user.destroy
        end

        redirect "/users"
    end
end