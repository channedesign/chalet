require 'rails_helper'

feature 'Add appartment to house' do
  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  scenario 'allow admin to create appartment'do
    login_as bob

    visit "/admin/houses/#{chalet.id}"

    click_link 'Add Appartment'
    within 'form' do
      fill_in 'Name', with: 'Panda'
      click_button 'Create Appartment'
    end

    expect(page).to have_content("Appartment was successfully created")
    expect(page).to have_content('Panda')
    expect(page.current_path).to eq(house_path(chalet.id))

  end

end
