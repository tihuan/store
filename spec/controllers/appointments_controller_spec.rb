require 'spec_helper'

describe AppointmentsController, type: :controller do
  let!(:appointment1) { FactoryGirl.create(:appointment) }
  let!(:appointment2) { FactoryGirl.create(:appointment) }

  describe 'GET #index' do
    it 'assigns all appointments to @appointments' do
      get :index
      expect(assigns(:appointments).last).to eq(appointment2)
    end

    it 'responds with JSON' do
      response = [appointment1.hour].to_json
      get :index, matched_date: appointment1.date
      expect(response).to eq(response)
    end
  end

  describe 'GET #show' do
    xit 'assigns appointment to @appointment' do
      get :show, id: appointment1.id
      expect(assigns(:appointment)).to eq(appointment1)
    end

    xit 'renders the show page' do
      get :show, id: appointment1.id
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it 'assigns appointment to @appointment' do
      get :new
      expect(assigns(:appointment).id).to eq(nil)
    end
  end

  describe 'POST #create' do
    context 'when appointment attributes are valid' do
      it 'redirects to show page' do
        post :create, appointments: attributes_for(:appointment)
        expect(response).to redirect_to(new_appointment_path)
      end
    end
  end
end

