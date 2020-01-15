class CharactersController < ApplicationController

    get "/characters" do
        @characters = Character.all
        erb :"/characters/index"
    end

    get "/characters/:id" do
        @character = Character.find_by(id: params[:id])

       erb :"/characters/show" 
    end
end