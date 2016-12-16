require 'rails_helper'

RSpec.describe 'Houses listing' do
  let!(:chalet1) { create :house }
  let!(:chalet2) { create :house }
  let!(:bob) { create :admin }
  scenario 'list all houses' do
    login_as bob
    visit '/houses'

    expect(page).to have_content(chalet1.name)
    expect(page).to have_content(chalet2.name)
  end

end
