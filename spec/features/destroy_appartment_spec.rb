require 'rails_helper'

feature 'Delete Appartment' do

  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id}

  scenario 'Allow admin to delete appartment' do
    login_as bob

    visit "/houses/#{chalet.id}"

    click_link "Delete #{panda.name}"

    expect(page).not_to have_content(panda.name)
    expect(page.current_path).to eq(house_path(chalet.id))
  end

end
