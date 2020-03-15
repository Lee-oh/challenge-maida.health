class PointsController < ApplicationController
before do
	protected!
end
get '/point_delete/:id' do
	@point = PointService::Query.new.show(params[:id])
	erb :'points/delete', layout: true
end
get '/point_edit/:id' do
	@point = PointService::Query.new.show(params[:id])
	erb :'points/edit', layout: true
end 
get '/point_new/:id' do
	@diet = DietService::Query.new.show(params[:id])
	erb :'points/new', layout: true
end
get '/point/:id' do
	@point = PointService::Query.new.show(params[:id])
	erb :'points/show', layout: true
end 
post '/point' do
	@point = PointService::Query.new.create(params[:title],params[:schedule],params[:weight],params[:diet_id])
	@point = PointService::Query.new.show(@point.id)
	erb :'points/show', layout: true
end
put '/point/:id' do
	@point = PointService::Query.new.update(params[:id],params[:title], params[:schedule], params[:weight])
	erb :'points/show', layout: true
end
delete '/point/:id' do
	@point = PointService::Query.new.delete(params[:id])
	redirect to("/user/#{session[:user_id]}")
end
end
