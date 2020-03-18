#rspec -I . --format doc user_spec.rb
require "spec_helper"
require 'pg'
require 'sinatra/activerecord'
require '../app/models/user.rb'
require '../app/models/diet.rb'
require '../app/models/point.rb'
require '../app/services/user_service.rb'
require '../app/services/diet_service.rb'
require '../app/services/point_service.rb'

describe 'Point' do

    it "Test point valid" do
        user = UserService::Query.new.create('james','james@email.com','123456')
        diet = DietService::Query.new.create('Crossfitness','Para viver tem que comer bem e se alimentar bem!','as 10 hs','03/03/2020','03/03/2020','Snack', '180', '100', '60', user.id) 
        result = PointService::Query.new.create('Resultados','03/03/2020','75',diet.id)
        expect(result.nil?).to eq(false)
    end
    it "Test point invalid title" do
        user = UserService::Query.new.login('james','123456')
        diet = DietService::Query.new.create('Crossfitness','Para viver tem que comer bem e se alimentar bem!','as 10 hs','03/03/2020','03/03/2020','Snack', '180', '100', '60', user) 
        result = PointService::Query.new.create( nil,'03/03/2020','75',diet.id)
        expect(result.nil?).to eq(true)
     end
     it "Test point invalid schedule" do
        user = UserService::Query.new.login('james','123456')
        diet = DietService::Query.new.create('Crossfitness','Para viver tem que comer bem e se alimentar bem!','as 10 hs','03/03/2020','03/03/2020','Snack', '180', '100', '60', user) 
        result = PointService::Query.new.create('Resultados', nil ,'75',diet.id)
        expect(result.nil?).to eq(true)
     end
     it "Test point invalid weight" do
        user = UserService::Query.new.login('james','123456')
        diet = DietService::Query.new.create('Crossfitness','Para viver tem que comer bem e se alimentar bem!','as 10 hs','03/03/2020','03/03/2020','Snack', '180', '100', '60', user) 
        result = PointService::Query.new.create('Resultados','03/03/2020', 70 ,diet.id)
        expect(result.nil?).to eq(true)
        UserService::Query.new.delete(user)
     end
end
