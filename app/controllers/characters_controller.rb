class CharactersController < ApplicationController

    get "/characters" do
        @characters = Character.all
        erb :"/characters/index"
    end

    get "/characters/new" do
        session[:character] = Character.new
        erb :"/characters/new"
    end

    get "/characters/:id" do
        @character = Character.find_by(id: params[:id])

       erb :"/characters/show" 
    end

    post "/characters" do
        case params[:answer]
        when "yes"
            redirect "/characters/new/info"
        when "no"
            redirect "/#{current_user.username}"
        end
    end

    get "/characters/new/info" do
        erb :"/characters/info"
    end

    post "/characters/info" do
        name, race, klass = params[character][name], params[character][race], params[character][klass]
        session[:character].name = name
        session[:character].race = race
        session[:character].klass = klass

        redirect "/characters/new/stats"
    end
end