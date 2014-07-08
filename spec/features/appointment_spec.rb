require 'spec_helper'

feature "appointment" do

  scenario "User creates an appointment" do
    visit root_path
    click_link("Create Appointment")
    expect(page).to have_css('#create-appointment-form')
  end
end
