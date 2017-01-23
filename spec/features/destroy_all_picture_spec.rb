require 'rails_helper'

feature 'Delete All Pictures' do
  let(:bob) { create :admin }
  let!(:chalet1) { create :house, name: 'chalet1' }
  let!(:chalet2) { create :house, name: 'chalet2' }
  let!(:picture1) { create :picture, name: 'pic1', house_id: chalet1.id }
  let!(:picture2) { create :picture, name: 'pic2', house_id: chalet1.id }
  let!(:picture3) { create :picture, name: 'pic3', house_id: chalet2.id }
  let!(:picture4) { create :picture, name: 'pic4', house_id: chalet2.id }

  scenario 'Allow Admin to delete all pictures' do
    login_as bob

    visit '/admin/pictures'

    within "#chalet_#{chalet1.id}" do
      expect(page).to have_content('pic1')
      expect(page).to have_content('pic2')
      expect(page).not_to have_content('pic3')
      expect(page).not_to have_content('pic4')
      click_link 'Delete All'
    end
    expect(page).not_to have_content('pic1')
    expect(page).not_to have_content('pic2')
    expect(page).to have_content('pic3')
    expect(page).to have_content('pic4')

    within "#chalet_#{chalet2.id}" do
      click_link 'Delete All'
    end
    expect(page).not_to have_content('pic3')
    expect(page).not_to have_content('pic4')
  end

end
