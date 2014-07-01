require 'spec_helper'

feature "account" do
  let!(:account) { FactoryGirl.create(:account) }

  scenario "User creates an account" do
    visit root_path
    click_link("Create Account")
    expect(page).to have_css('#create-account-form')
  end
end
