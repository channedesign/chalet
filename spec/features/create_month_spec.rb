require 'rails_helper'

feature 'Add month to appartment' do
  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }

  scenario 'Allow admin to create appartment' do
    login_as bob

    visit "/admin/houses/#{chalet.id}"

    click_link 'Add Month'

    within 'form' do
      fill_in 'Name', with: 'December'
      click_button 'Create Month'
    end

    expect(page.current_path).to eq(house_path(chalet.id))
    expect(page).to have_content('Month was successfully created')
    expect(page).to have_content('December')


  end

end
