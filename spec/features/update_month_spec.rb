require 'rails_helper'

feature 'Edit Month' do
  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }
  let!(:december) { create :month, appartment_id: panda.id}
  scenario 'Allow admin to edit month' do

    login_as bob

    visit "/admin/houses/#{chalet.id}"

    click_link "Edit #{december.name}"

    within 'form' do
      fill_in 'Name', with: 'January'
      click_button 'Update Month'
    end

    expect(page.current_path).to eq(house_path(chalet.id))
    expect(page).to have_content('Month was successfully updated')
    expect(page).to have_content('January')

  end

end
