require 'rails_helper'
require 'capybara/rspec'

describe 'Groups controller', type: :feature do
  before :each do
    u = User.new(name: 'Murilo', age: 27, height: 10, weight: 500, gender: 'Male', email: 'murilo@gmail.com',
                 activity: 'Extra active')
    u.save
    f = Food.new(name: 'banana', amount: 300, author_id: u.id)
    f.save
    visit '/login'
    within('form') do
      fill_in 'session_name', with: 'Murilo'
    end
    click_button 'Log in'
  end

  it 'creates group' do
    visit '/groups/new'
    within('form') do
      fill_in 'group[name]', with: 'test group'
      fill_in 'group[icon]', with: 'https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png'
    end
    click_button 'Add'
    expect(page).to have_content 'FOODS IN THIS GROUP'
  end
end
