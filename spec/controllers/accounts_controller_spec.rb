require 'spec_helper'

describe AccountsController, type: :controller do
  let!(:account1) { FactoryGirl.create(:account) }
  let!(:account2) { FactoryGirl.create(:account) }

  describe 'GET #index' do
    it "assigns all accounts to @accounts" do
      get :index
      assigns(:accounts).should eq([account1, account2])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it "renders the show page" do
      get :show, id: account1.id
      expect(response).to render_template(:show)
    end

    it "assigns the requested city to @city" do
      get :show, id: account1.id
      assigns(:account).should eq(account1)
    end
  end
end
