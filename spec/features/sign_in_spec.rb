require 'rails_helper'

RSpec.describe 'Sign Admin In' do
  let!(:bob) { create :admin }

  scenario 'with valid credentials' do
    visit '/admin'

    within('#new_admin')do
      fill_in 'Email', with: 'bob@sample.com'
      fill_in 'Password', with: 'Password'
    end

    click_button 'Log in'
    expect(page.current_path).to eq(admin_path)
    expect(page).to have_content 'Signed in successfully'
  end

  scenario 'with invalid credentials' do
    visit '/admin'

    within('#new_admin')do
      fill_in 'Email', with: 'bob@sample.com'
      fill_in 'Password', with: 'Nottherightone'
    end

    click_button 'Log in'
    expect(page.current_path).to eq(new_admin_session_path)
    expect(page).to have_content 'Invalid Email or password'
  end

end
