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

describe 'Diet' do

    it "Test diet valid" do
        user = UserService::Query.new.create('james','james@email.com','123456') 
        result = DietService::Query.new.create('Crossfitness','Para viver tem que comer bem e se alimentar bem!','as 10 hs','03/03/2020','03/03/2020','Snack', '180', '100', '60', user.id)
        expect(result.nil?).to eq(false)
    end
    it "Test diet invalid title" do
        user = UserService::Query.new.login('james','123456')
        result = DietService::Query.new.create(nil,'Para viver tem que comer bem e se alimentar bem!','as 10 hs','03/03/2020','03/03/2020','Snack', '180', '100', '60', user)
        expect(result.nil?).to eq(true)
     end
     it "Test diet invalid description" do
        user = UserService::Query.new.login('james','123456')
        result = DietService::Query.new.create('Crossfitness',nil,'as 10 hs','03/03/2020','03/03/2020','Snack', '180', '100', '60', user)
        expect(result.nil?).to eq(true)
     end
     it "Test diet invalid height" do
        user = UserService::Query.new.login('james','123456')
        result = DietService::Query.new.create('Crossfitness','Para viver tem que comer bem e se alimentar bem!','as 10 hs','03/03/2020','03/03/2020','Snack', 180, '100', '60', user)
        expect(result.nil?).to eq(true)
     end
     it "Test diet invalid weight" do
        user = UserService::Query.new.login('james','123456')
        result = DietService::Query.new.create('Crossfitness','Para viver tem que comer bem e se alimentar bem!','as 10 hs','03/03/2020','03/03/2020','Snack', '180', 100, '60', user)
        expect(result.nil?).to eq(true)
     end
     it "Test diet invalid target_weight" do
        user = UserService::Query.new.login('james','123456')
        result = DietService::Query.new.create('Crossfitness','Para viver tem que comer bem e se alimentar bem!','as 10 hs','03/03/2020','03/03/2020','Snack', '180', '100', 60, user)
        expect(result.nil?).to eq(true)
     end
     it "Test diet invalid start" do
        user = UserService::Query.new.login('james','123456')
        result = DietService::Query.new.create('Crossfitness','Para viver tem que comer bem e se alimentar bem!','as 10 hs',nil,'03/03/2020','Snack', '180', '100', '60', user)
        expect(result.nil?).to eq(true)
    end
    it "Test diet invalid finish" do
        user = UserService::Query.new.login('james','123456')
        result = DietService::Query.new.create('Crossfitness','Para viver tem que comer bem e se alimentar bem!','as 10 hs','03/03/2020',nil,'Snack', '180', '100', '60', user)
        expect(result.nil?).to eq(true)
        UserService::Query.new.delete(user)
    end
end
