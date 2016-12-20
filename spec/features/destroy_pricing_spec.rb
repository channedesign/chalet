require 'rails_helper'

feature 'Delete Pricing' do
  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }
  let!(:december) { create :month, appartment_id: panda.id }
  let!(:week1) { create :week, month_id: december.id }
  let!(:price) { create :pricing, week_id: week1.id}

  scenario 'Allow admin to delete pricing' do

    login_as bob

    visit "/houses/#{chalet.id}"

    expect(page).to have_content(price.self_catered)
    expect(page).to have_content(price.weekend)
    click_link 'Delete Pricing'

    expect(page.current_path).to eq(house_path(chalet.id))
    expect(page).not_to have_content(price.self_catered)
    expect(page).not_to have_content(price.weekend)

  end

end
