require 'spec_helper'

feature 'User creates an appointment' do
  scenario 'with valid attributes', js: true do
    visit root_path
    expect {
      click_link('Create Appointment')
      find("#datepicker").click
      find(".ui-datepicker-today").click
      find('#hour_picker > table > tbody > tr:nth-child(2) > td').click
      click_button('Create Appointment')
    }.to change(Appointment, :count).by(1)
  end
end
