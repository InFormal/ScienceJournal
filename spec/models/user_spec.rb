require 'spec_helper'

describe User do
  before :each do
    load "#{Rails.root}/db/seeds.rb"
    @admin_user = User.first!
  end
  it 'admin should exist' do
    @admin_user.user_roles.first.should_not be_nil
    @admin_user.user_roles.first.name.should eql 'admin'
  end
  it 'admin can manage all' do
    Ability.new(@admin_user).can?(:manage, :all).should be_true
  end
  it 'name should exists' do
    user = FactoryGirl.create(:user)
    user.name = ''
    user.should_not be_valid
  end
  it 'name should be unique' do
    exist_user = FactoryGirl.create(:user)
    user = User.new(name: exist_user.name, password: exist_user.password, email: exist_user.email + 'a')
    user.should_not be_valid
  end
  it 'autor should be approved by default' do
    user = FactoryGirl.create(:user)
    user.should be_is_approved
  end
  it 'censor should not be approved by default' do
    user = FactoryGirl.create(:user)
    user.user_roles = [Role.new(name: 'Censor')]
    user.save
    user.should_not be_is_approved
  end
end