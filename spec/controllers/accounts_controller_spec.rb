require 'spec_helper'

describe AccountsController, type: :controller do
  let!(:account1) { FactoryGirl.create(:account) }
  let!(:account2) { FactoryGirl.create(:account) }

  describe 'GET #index' do
    it 'assigns all accounts to @accounts' do
      get :index
      expect(assigns(:accounts).last).to eq(account2)
    end

    it 'assigns account to @account' do
      get :show, id: account1.id
      expect(assigns(:account)).to eq(account1)
    end

    it 'assigns account to @account' do
      get :new
      expect(assigns(:account).id).to eq(nil)
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'renders the show page' do
      get :show, id: account1.id
      expect(response).to render_template(:show)
    end
  end

  describe 'POST #create' do
    context 'when account attributes are valid' do
      it 'redirects to show page' do
        post :create, account: attributes_for(:account)
        expect(response).to redirect_to(account_path(assigns[:account]))
      end
    end

    context 'when account attributes are invalid' do
      it 'renders the new page' do
        post :create, account: { fname: "Test" }
        expect(response).to render_template(:new)
      end
    end
  end
end
