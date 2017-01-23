require 'rails_helper'

feature 'List all Pictures' do
  let(:bob) { create :admin }
  let!(:chalet1) { create :house, name: 'chalet1' }
  let!(:chalet2) { create :house, name: 'chalet2' }
  let!(:picture1) { create :picture, name: 'pic1', house_id: chalet1.id }
  let!(:picture2) { create :picture, name: 'pic2', house_id: chalet2.id }
  scenario 'List pictures per houses' do
    login_as bob

    visit '/admin/pictures'
    expect(find("#chalet_#{chalet1.id}")).to have_content(picture1.name)
    expect(find("#chalet_#{chalet1.id}")).not_to have_content(picture2.name)

    expect(find("#chalet_#{chalet2.id}")).to have_content(picture2.name)
    expect(find("#chalet_#{chalet2.id}")).not_to have_content(picture1.name)
  end

end
