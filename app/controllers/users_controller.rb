class UsersController < ApplicationController

    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        @us
    end
end