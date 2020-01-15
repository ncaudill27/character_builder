class CharactersController < ApplicationController

    get "/characters" do
        @characters = Character.all
        erb :"/characters/index"
    end

    get "/characters/new" do
        @character = Character.new

        erb :"/characters/new"
    end

    get "/characters/:id" do
        @character = Character.find_by(id: params[:id])

       erb :"/characters/show" 
    end

    post "/characters" do
       @character = Character.new(params[:character])
       @character.user = current_user
       @character.save

       redirect "/characters/#{@character.id}"
    end

    get "/characters/:id/edit" do
        @character = Character.find_by(id: params[:id])

        erb :"/characters/edit"
    end

    patch "/characters/:id" do
        character = Character.find_by(id: params[:id])
        character.update(params[:character])
        
        redirect "/characters/#{character.id}"
    end

    delete "/characters/:id" do
        character = Character.find_by(id: params[:id])
        user = character.user
        character.destroy

        redirect "/#{user.username}"
    end
end