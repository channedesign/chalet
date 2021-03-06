require 'rails_helper'

feature 'Delete a Week' do

  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }
  let!(:december) { create :month, appartment_id: panda.id }
  let!(:week1) { create :week, month_id: december.id }

  scenario 'Allow admin to delete a week' do

    login_as bob

    visit "/admin/houses/#{chalet.id}"
    expect(page).to have_content("#{week1.from.day}-#{week1.to.day} #{december.name[0, 3]}")
    expect(page).to have_content('€1000')
    expect(page).to have_content('€500')
    click_link 'Delete Week'

    expect(page.current_path).to eq(house_path(chalet.id))
    expect(page).not_to have_content("#{week1.from.day}-#{week1.to.day} #{december.name[0, 3]}")
    expect(page).not_to have_content('€1000')
    expect(page).not_to have_content('€500')
    expect(page).to have_content('Week was successfully destroyed')


  end

end
