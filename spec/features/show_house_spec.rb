require 'rails_helper'

feature 'show house' do
  let(:bob) { create :admin }
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }
  let!(:december) { create :month, appartment_id: panda.id }
  let!(:week1) { create :week, month_id: december.id }


  scenario 'shows a house' do
    login_as bob

    visit '/houses'

    click_link "Manage #{chalet.name}"
    expect(page.current_path).to eq(house_path(chalet))
    expect(page).to have_content(panda.name)
    expect(page).to have_content('Add Appartment')


  end

  scenario 'shows a house with its month and week' do
    login_as bob

    visit "/houses/#{chalet.id}"

    expect(page).to have_link('Add Month')
    expect(page).to have_content(december.name)

    expect(page).to have_link('Add Week')
    expect(page).to have_content("#{week1.from}-#{week1.to}")



  end

  scenario 'shows a house with no pricings' do
    login_as bob

    visit "/houses/#{chalet.id}"

    expect(page).to have_link('Add Pricings')
    expect(page).not_to have_link('Delete Pricings')
    expect(page).not_to have_content(week1.pricings)
  end

  scenario 'shows a house with pricings' do

    price = create :pricing, week_id: week1.id
    login_as bob

    visit "/houses/#{chalet.id}"

    expect(page).to have_link('Delete Pricings')
    expect(page).not_to have_link('Add Pricings')
    expect(page).to have_content(price.self_catered)
    expect(page).to have_content(price.weekend)
  end

end
