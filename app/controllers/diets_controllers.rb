class DietsController < ApplicationController
before do
	protected!
end
get '/diet_delete/:id' do
	@diet= DietService::Query.new.show(params[:id])	
	erb :'diets/delete', layout: true
end
get '/diet_edit/:id' do
	@diet= DietService::Query.new.show(params[:id])	
	erb :'diets/edit', layout: true
end 
get '/diet_new' do
	erb :'diets/new', layout: true
end
get '/diet' do
	@diets = DietService::Query.new.get_all(session[:user_id])
	erb :'diets/index', layout: true
end
get '/diet/:id' do
	@points = PointService::Query.new.get_all(params[:id])
	@diet = DietService::Query.new.show(params[:id])
	erb :'diets/show', layout: true
end
post '/diet' do
	@diet = DietService::Query.new.create(params[:title],params[:description], params[:schedule],params[:start], params[:finish], params[:period], params[:height], params[:weight], params[:target_weight],session[:user_id])
	redirect to("/diet/#{@diet.id}")	
	erb :'diets/show', layout: true
end
put '/diet/:id' do
	@diet = DietService::Query.new.update(params[:id],params[:title],params[:description], params[:schedule],params[:start], params[:finish], params[:period], params[:height], params[:weight], params[:target_weight])
	@points = PointService::Query.new.get_all(@diet.id)
	erb :'diets/show', layout: true
end
delete '/diet/:id' do
	@diet = DietService::Query.new.delete(params[:id])
	redirect to('/')
end
end
