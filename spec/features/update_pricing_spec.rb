require 'rails_helper'

feature 'Edit Pricing' do
  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }
  let!(:december) { create :month, appartment_id: panda.id }
  let!(:week1) { create :week, month_id: december.id }
  let!(:price) { create :pricing, week_id: week1.id}

  scenario 'Allow admin to edit pricings' do

    login_as bob

    visit "/houses/#{chalet.id}"

    expect(page).to have_content(price.self_catered)
    expect(page).to have_content(price.weekend)

    click_link price.self_catered

    expect(page.current_path).to eq(edit_pricing_path(price.id))
    within 'form' do
      fill_in 'Self catered', with: '500'
      fill_in 'pricing_weekend', with: '50'
      click_button 'Update Pricing'
    end

    expect(page.current_path).to eq(house_path(chalet.id))
    expect(page).to have_content('Pricing was successfully updated')
    expect(page).to have_content('€500')
    expect(page).to have_content('€50')

  end

end
