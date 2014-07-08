require 'spec_helper'

describe ServicesController, type: :controller do
  let!(:service1) { FactoryGirl.create(:service) }
  let!(:service2) { FactoryGirl.create(:service) }

  describe 'GET #index' do
    it "assigns all services to @services" do
      get :index
      expect(assigns(:services).last).to eq(service2)
    end
  end
end
