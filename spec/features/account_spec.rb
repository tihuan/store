require 'spec_helper'

feature 'User creates an account' do
  scenario 'with valid attributes' do
    visit root_path
    expect {
      click_link('Create Account')
      fill_in 'account_fname', with: "John"
      fill_in 'account_lname', with: "Smith"
      fill_in 'account_birthdate', with: "2013-09-12"
      fill_in 'account_email', with: "JohnSmith@boyerfunk.com"
      fill_in 'account_phone', with: "1-445-897-9107 x30333"
      fill_in 'account_address', with: "4123 Green Parkways"
      fill_in 'account_password', with: "awesomepasswordhere"
      fill_in 'account_memo', with: "aggregate strategic e-services not sure what it means"
      click_button "Create Account"
    }.to change(Account, :count).by(1)
    expect(page).to have_content "Account successfully created."
    within 'h1' do
      expect(page).to have_content "John Smith"
    end
    expect(page).to have_content "Birthday: 2013-09-12"
    expect(page).to have_content "Phone: 1-445-897-9107 x30333"
    expect(page).to have_content "Memo: aggregate strategic e-services not sure what it means"
  end

  scenario 'with invalid attributes' do
    visit root_path
    expect {
      click_link('Create Account')
      fill_in 'account_fname', with: "John"
      fill_in 'account_lname', with: "Smith"
      fill_in 'account_birthdate', with: "2013-09-12"
      fill_in 'account_email', with: "JohnSmith@boyerfunk.com"
      fill_in 'account_phone', with: "1-445-897-9107 x30333"
      fill_in 'account_address', with: "4123 Green Parkways"
      fill_in 'account_password', with: ""
      fill_in 'account_memo', with: "aggregate strategic e-services not sure what it means"
      click_button "Create Account"
    }.to change(Account, :count).by(0)
    expect(page).to have_content "Failed to create account. Please try again."
  end
end
