require 'rails_helper'

feature 'Add  Pricings' do

  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }
  let!(:december) { create :month, appartment_id: panda.id }
  let!(:week1) { create :week, month_id: december.id }

  scenario 'Allow admin to add pricings to week' do

    login_as bob

    visit "/houses/#{chalet.id}"

    click_link 'Add Pricings'

    expect(page.current_path).to eq(new_pricing_path)

    within 'form' do
      fill_in 'Self catered', with: '500'
      fill_in 'pricing_weekend', with: '50'
      click_button 'Create Pricing'
    end

    expect(page.current_path).to eq(house_path(chalet.id))
    expect(page).to have_content('Pricing was successfully created')
    expect(page).to have_content('€500')
    expect(page).to have_content('€50')

  end

end
