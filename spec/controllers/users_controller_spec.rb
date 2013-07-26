require 'spec_helper'

describe UsersController do
  describe 'POST #create' do
    before { post :create, :user => { :username => "dude", 
                                      :password => "pword", 
                                      :password_confirmation => "pword"} }
    it "signs a new user in" do
      session[:current_user_id].should_not be_nil
    end
  end
end
