require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  let(:user) { create(:user) } # Assuming you have a User factory set up

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns the user's subscriptions to @subscriptions" do
      subscription = create(:subscription, user: user)
      get :index
      expect(assigns(:subscriptions)).to include(subscription)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end

    it "assigns a new Feed to @feed" do
      get :new
      expect(assigns(:feed)).to be_a_new(Feed)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_params) { { feed: attributes_for(:feed) } }

      it "creates a new Feed" do
        expect {
          post :create, params: valid_params
        }.to change(Feed, :count
