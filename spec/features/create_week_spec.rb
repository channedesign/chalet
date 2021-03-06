require 'rails_helper'

feature 'Add Week to month' do
  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }
  let!(:december) { create :month, appartment_id: panda.id}
  scenario 'Allow admin to create a week' do

    login_as bob

    visit "/admin/houses/#{chalet.id}"

    click_link "Add Week to #{december.name}"
    within 'form' do
      fill_in 'From', with: '01/12/2016'
      fill_in 'To', with: '07/12/2016'
      fill_in 'Self catered', with: '1000'
      fill_in 'Weekend', with: '500'
      click_button 'Create Week'
    end

    expect(page.current_path).to eq(house_path(chalet.id))
    expect(page).to have_content('Week was successfully created')
    expect(page).to have_content('1-7 Dec')
    expect(page).to have_content('€1000')
    expect(page).to have_content('€500')
  end

end
