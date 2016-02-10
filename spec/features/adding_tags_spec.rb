require 'web_helper'
feature 'Adding tags to bookmark links' do
  scenario 'tag a single link' do
    create_bookmark
    # Tag.create(tag: random)
    fill_in('name', with: 'random')
    click_button 'Submit'
    expect(page).to have_content('random')
  end
end