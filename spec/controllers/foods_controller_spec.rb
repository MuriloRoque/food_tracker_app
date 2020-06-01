require 'rails_helper'
require 'capybara/rspec'

describe 'Foods controller', type: :feature do
  before :each do
    u = User.new(name: 'Murilo', age: 27, height: 10, weight: 500,
                 gender: 'Male', email: 'murilo@gmail.com', activity: 'Extra active')
    u.save
    f = Food.new(name: 'banana', amount: 300, author_id: User.last.id)
    f.save
    visit '/login'
    within('form') do
      fill_in 'session_name', with: 'Murilo'
    end
    click_button 'Log in'
  end

  it 'creates food' do
    visit '/foods/new'
    within('form') do
      fill_in 'food[name]', with: 'banana'
      fill_in 'food[amount]', with: '500'
    end
    click_button 'Add'
    expect(page).to have_content 'banana'
  end

  it 'checks if calories method works' do
    u = User.last
    bmr = ((66 + 6.23 * u.weight + 12.7 * u.height - 6.8 * u.age) * 1.9).to_i
    expect(page).to have_content "You already consumed 300 kcal today, you still
                                  need to consume #{bmr - 300} kcal in order to
                                  achieve your daily goal."
  end
end
