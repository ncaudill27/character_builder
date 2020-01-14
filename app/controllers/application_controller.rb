require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret_key"
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def logged_in?
      !!current_user 
    end

    def current_user
      User.find_by(email: session[:email])
    end

  end
end
