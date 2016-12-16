require 'rails_helper'

RSpec.describe 'Sign Admin Out' do
  let!(:bob) { create :admin }
  scenario 'successfully' do

    visit '/admin'

    within('#new_admin')do
      fill_in 'Email', with: 'bob@sample.com'
      fill_in 'Password', with: 'Password'
    end

    click_button 'Log in'
    expect(page.current_path).to eq(admin_path)
    expect(page).to have_content 'Log Out'

    click_link 'Log Out'
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content 'Signed out successfully'

  end

end
