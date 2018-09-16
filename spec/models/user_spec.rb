require 'rails_helper'

RSpec.describe User, type: :model do
 context'Testing User Model About Validation' do
 	it 'ensure user first name presence' do
 		user = User.new(first_name:'First' , email:'sample@email.com').save
 		expect(user).to eq(false)
 	end

 	it 'ensure user last name presence' do
 		user = User.new( last_name:'Last' , email:'sample@email.com').save
 		expect(user).to eq(false)
 	end

 	it 'ensure user email presence' do
 		user = User.new(last_name:'Last',first_name:'First').save
 		expect(user).to eq(false)
 	end

 	it 'should successfully' do
 		user = User.new( last_name:'Last' , first_name:'First',email:'sample@email.com',password:"123456789").save
 		expect(user).to eq(true)
 	end

  end

 

 end
