require 'rails_helper'

feature 'Delete Month' do
  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }
  let!(:december) { create :month, appartment_id: panda.id}

  scenario 'Allow admin to delete a month' do
    login_as bob
    visit "/admin/houses/#{chalet.id}"
    expect(page).to have_content('December')
    click_link "Delete #{december.name}"

    expect(page.current_path).to eq(house_path(chalet.id))
    expect(page).not_to have_content('December')
  end

end
