class UsersController < ApplicationController
get '/stats' do
    erb :'users/stats', layout: true
end
get '/user_edit/:id' do
    if params[:id].to_s == session[:user_id].to_s
        @user = UserService::Query.new.show(params[:id])
        erb :'users/edit', layout: true
    else
        erb :error, layout: true  
    end   
end
get '/user_delete/:id' do
    if params[:id].to_s == session[:user_id].to_s
        @user = UserService::Query.new.show(params[:id])
        erb :'users/delete', layout: true
    else
        erb :error, layout: true  
    end
end
get '/login' do
    erb :'users/login', layout: true
end
post '/login' do
    session[:user_id] = UserService::Query.new.login(params[:username].strip,params[:password].strip)
    @user = UserService::Query.new.show(session[:user_id])
    erb :'users/show', layout: true
end
get '/signup' do
    erb :'users/new', layout: true
end
get '/logout' do
    session[:user_id] = nil
    erb :index, layout: true
end
get '/user/:id' do
    if params[:id].to_s == session[:user_id].to_s
        @user = UserService::Query.new.show(params[:id])
        erb :'users/show', layout: true
    else
        erb :error, layout: true  
    end
end
post '/user' do
    if @user = UserService::Query.new.create(params[:username],params[:email].strip,params[:password].strip)
        session[:user_id] = @user.id
        erb :'users/show', layout: true
    else
        erb :error, layout: true     
    end   
end
delete '/user/:id' do
    if params[:id].to_s == session[:user_id].to_s
        @user = UserService::Query.new.delete(params[:id])
        redirect to('/')
    else
        erb :error, layout: true  
    end 
end
put '/user/:id' do
    if params[:id].to_s == session[:user_id].to_s
        @user = UserService::Query.new.update(params[:id],params[:username],params[:email],params[:password].strip)
        erb :'users/show', layout: true
    else
        erb :error, layout: true  
    end 
end
end
