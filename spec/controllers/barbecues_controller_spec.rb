require 'rails_helper'

RSpec.describe BarbecuesController, type: :controller do
  describe "anonymous user" do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it "should be redirected to signin" do
      get :index
      expect( response ).to redirect_to( new_user_session_path )
    end
  end

  describe "logged in user" do
    it "should let a user see all the posts" do
      login_with create( :user )
      get :index
      expect( response ).to render_template( :index )
    end
  end
end
