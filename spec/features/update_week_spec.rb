require 'rails_helper'

feature 'Edit Week' do
  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }
  let!(:december) { create :month, appartment_id: panda.id }
  let!(:week1) { create :week, month_id: december.id }
  scenario 'Allow admin to edit a week' do

    login_as bob

    visit "/admin/houses/#{chalet.id}"

    click_link "#{week1.from.day}-#{week1.to.day} #{december.name[0,3]}"

    expect(page.current_path).to eq(edit_week_path(week1.id))

    within 'form' do
      fill_in 'From', with: '10/12/2016'
      fill_in 'To', with: '17/12/2016'
      fill_in 'Self catered', with: '5000'
      fill_in 'Weekend', with: '2000'
      click_button 'Update Week'
    end

    expect(page.current_path).to eq(house_path(chalet.id))
    expect(page).to have_content('10-17 Dec')
    expect(page).to have_content('€5000')
    expect(page).to have_content('€2000')
    expect(page).to have_content('Week was successfully updated')


  end

end
