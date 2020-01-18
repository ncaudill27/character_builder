class CharactersController < ApplicationController

    get "/characters" do
        @characters = Character.all
        erb :"/characters/index"
    end

    get "/characters/new" do
        @character = Character.new
        @races = Race.all
        @klasses = Klass.all

        erb :"/characters/new"
    end

    get "/characters/:id" do
        @character = Character.find_by(id: params[:id])

        erb :"/characters/show" 
    end

    post "/characters" do
        @character = Character.new(params[:character])
        @character.race = Race.find_by(params[:race])
        @character.klass = Klass.find_by(params[:klass])
        @character.user = current_user
        @character.save

        redirect "/characters/#{@character.id}"
    end

    get "/characters/:id/edit" do
        @character = Character.find_by(id: params[:id])
        @races = Race.all
        @klasses = Klass.all

        erb :"/characters/edit"
    end

    patch "/characters/:id" do
        character = Character.find_by(id: params[:id])
        character.update(params[:character])
        character.klass.update(params[:klass])
        character.race.update(params[:race])
        
        redirect "/characters/#{character.id}"
    end

    delete "/characters/:id" do
        character = Character.find_by(id: params[:id])
        user = character.user
        character.destroy

        redirect "/#{user.username}"
    end
end