require 'rails_helper'

feature 'show house' do
  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }
  scenario 'shows a house' do
    login_as bob

    visit '/houses'

    click_link "Manage #{chalet.name}"
    expect(page.current_path).to eq(house_path(chalet))
    expect(page).to have_content(panda.name)
    expect(page).to have_content('Add Appartment')


  end

end
