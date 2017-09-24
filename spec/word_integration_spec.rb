require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the word creation path', {:type=> :feature}) do
  it('processes the user entry and displays word') do
    visit('/')
    fill_in('word', :with=> 'Apple')
    click_button('Add Word!')
    expect(page).to have_content('Apple')
  end
end

# describe('the word creations path', {:type=> :feature}) do
#   it('processes the user entries and displays words') do
#     visit('/')
#     fill_in('word', :with=> 'Apple')
#     click_button('Add Word!')
#     fill_in('word', :with=> 'Banana')
#     click_button('Add Word!')
#     expect(page).to have_content('Apple')
#     expect(page).to have_content('Banana')
#   end
# end
#
# describe('the blank field error path', {:type=> :feature}) do
#   it('displays error message when clicking "Add Word!" with an empty input field.') do
#     visit('/')
#     fill_in('word', :with=> '')
#     click_button('Add Word!')
#     expect(page).to have_content("Please enter a word.")
#   end
# end
#
# describe('definition page path', {:type=> :feature}) do
#   it('displays clicked word on new page.') do
#     visit('/')
#     fill_in('word', :with=> 'Word1')
#     click_button('Add Word!')
#     click_on('Word1')
#     expect(page).to have_content("Word1")
#   end
# end
#
# describe('definition page path', {:type=> :feature}) do
#   it('creates definitions.') do
#     visit('/')
#     fill_in('word', :with=> 'Word1')
#     click_button('Add Word!')
#     click_on('Word1')
#     fill_in('definition', :with=> 'A definition of the word.')
#     click_button('Add Definition!')
#     fill_in('definition', :with=> 'A 2nd definition of the word.')
#     click_button('Add Definition!')
#     expect(page).to have_content('A 2nd definition of the word.')
#   end
# end
#
# describe('homepage path', {:type=> :feature}) do
#   it('takes user back to homepage from definition page') do
#     visit('/words/:id')
#     click_link('Return Home!')
#     visit('/')
#     expect(page).to have_content("Welcome to Your Words!")
#   end
# end
