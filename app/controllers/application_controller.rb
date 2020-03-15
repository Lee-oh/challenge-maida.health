require 'sinatra/base'
require 'sinatra/activerecord'
require './app/models/user.rb'
require './app/models/diet.rb'
require './app/models/point.rb'
require './app/services/user_service.rb'
require './app/services/diet_service.rb'
require './app/services/point_service.rb'

class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
    set :bind, '0.0.0.0'
    set :port, 9292
  end
  get '/' do
    erb :index, layout: true
  end
  not_found do
    erb :not_found, layout: true
  end
  helpers do
  def protected!
    if login?
        redirect to('/login')
    end
  end
  def login?
    begin
      if session[:user_id].eql?(nil)
        @user = UserService::Query.new.show(session[:user_id])
        if @user.id == session[:user_id]
          return false
        else
          return true
        end
      end
    rescue Exception => e
      erb :index, layout: true
    end
  end
  end
end
