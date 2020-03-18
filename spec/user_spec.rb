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

describe 'User' do
    it "Test user valid" do 
       result = UserService::Query.new.create('john','john@email.com','123456')
       expect(!result.nil?).to eq(true)
       UserService::Query.new.delete(result.id)
    end
    it "Test user invalid username" do 
        result = UserService::Query.new.create('','mary@email.com','123456')
        expect(!result.nil?).to eq(true)
    end
    it "Test user invalid email" do 
        result = UserService::Query.new.create('mary','mary@email','123456')
        expect(!result.nil?).to eq(true)
    end
    it "Test user invalid password" do 
        result = UserService::Query.new.create('mary','mary@email.com','123')
        expect(!result.nil?).to eq(false)
    end
    it "Test login success" do 
        user = UserService::Query.new.create('piter','piter@email.com','123456')
        result = UserService::Query.new.login('piter','123456')
        expect(result).to eq(user.id)
        UserService::Query.new.delete(result)
    end
end
