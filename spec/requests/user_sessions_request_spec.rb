require 'spec_helper'

describe "GET '/auth/meetup/callback'" do

  before(:each) do
    valid_meetup_login_setup
    get "http://localhost:3000/users/auth/meetup/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:meetup]
  end

  it "should set user_id" do
    expect(session[:user_id]).to eq(User.last.id)
  end

  it "should redirect to root" do
    expect(response).to redirect_to root_path
  end
end

describe "GET '/auth/failure'" do

  it "should redirect to root" do
    get "/auth/failure"
    expect(response).to redirect_to root_path
  end
end
