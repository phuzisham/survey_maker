require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new survey', {:type => :feature}) do
  it('allows user to create a new survey') do
    visit('/')
    fill_in('title', :with => 'Huh?')
    click_button('Add Survey')
    expect(page).to have_content('Huh?')
  end
end
