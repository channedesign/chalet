require 'rails_helper'

feature 'Edit Appartment' do
  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id}

  scenario 'Allow admin to edit appartment' do
    login_as bob
    visit "/houses/#{chalet.id}"

    click_link panda.name
    expect(page.current_path).to eq(edit_appartment_path(panda.id))

    within 'form' do
      fill_in 'Name', with: 'Hiboux'
      click_button 'Update Appartment'
    end

    expect(page.current_path).to eq(house_path(chalet.id))
    expect(page).to have_content('Appartment was successfully updated')
    expect(page).to have_content('Hiboux')

  end

end
