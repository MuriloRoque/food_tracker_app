require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'Should be valid if the attributes are' do
      expect(User.new(name: 'MuriloR', age: 27, height: 10, weight: 500, gender: 'Male',
                      email: 'muriloengqui@gmail.com', activity: 'Extra active')).to be_valid
    end

    it "Shouldn't save if the name is less than 6 characters" do
      u = User.new(name: 'Muril', age: 27, height: 10, weight: 500, gender: 'Male', email: 'muriloengqui@gmail.com',
                   activity: 'Extra active')
      expect(u.save).to eq(false)
    end

    it "Shouldn't save if the name is more than 10 characters" do
      u = User.new(name: 'MuriloRoque', age: 27, height: 10, weight: 500, gender: 'Male',
                   email: 'muriloengqui@gmail.com', activity: 'Extra active')
      expect(u.save).to eq(false)
    end

    it "Shouldn't save if the name is already taken" do
      u1 = User.new(name: 'Murilo', age: 27, height: 10, weight: 500, gender: 'Male', email: 'muriloengqui1@gmail.com',
                    activity: 'Extra active')
      u1.save
      u2 = User.new(name: 'Murilo', age: 27, height: 10, weight: 500, gender: 'Male',
                    email: 'muriloengqui2@gmail.com', activity: 'Extra active')
      expect(u2.save).to eq(false)
    end

    it "Shouldn't save if the email is less than 11 characters" do
      u = User.new(name: 'Murilo', age: 27, height: 10, weight: 500, gender: 'Male', email: '@gmail.com',
                   activity: 'Extra active')
      expect(u.save).to eq(false)
    end

    it "Shouldn't save if the e-mail is already taken" do
      u1 = User.new(name: 'Murilo1', age: 27, height: 10, weight: 500, gender: 'Male', email: 'muriloengqui@gmail.com',
                    activity: 'Extra active')
      u1.save
      u2 = User.new(name: 'Murilo2', age: 27, height: 10, weight: 500, gender: 'Male', email: 'muriloengqui@gmail.com',
                    activity: 'Extra active')
      expect(u2.save).to eq(false)
    end

    it "Shouldn't save if the age is less than 1" do
      u = User.new(name: 'Murilo', age: 0, height: 10, weight: 500, gender: 'Male', email: '@gmail.com',
                   activity: 'Extra active')
      expect(u.save).to eq(false)
    end

    it "Shouldn't save if the height is more than 10 inches" do
      u = User.new(name: 'Murilo', age: 27, height: 11, weight: 500, gender: 'Male', email: '@gmail.com',
                   activity: 'Extra active')
      expect(u.save).to eq(false)
    end

    it "Shouldn't save if the weight is more than 1200 characters" do
      u = User.new(name: 'Murilo', age: 27, height: 10, weight: 1500, gender: 'Male', email: '@gmail.com',
                   activity: 'Extra active')
      expect(u.save).to eq(false)
    end

    it "Shouldn't save if the gender is not selected" do
      u = User.new(name: 'Murilo', age: 27, height: 10, weight: 500, email: '@gmail.com', activity: 'Extra active')
      expect(u.save).to eq(false)
    end

    it "Shouldn't save if activity is not selected" do
      u = User.new(name: 'Murilo', age: 27, height: 10, weight: 500, email: '@gmail.com', gender: 'Male')
      expect(u.save).to eq(false)
    end

    it 'Should save if everything validates' do
      u = User.new(name: 'MuriloRo', age: 27, height: 10, weight: 500, gender: 'Male', email: 'muriloengqui@gmail.com',
                   activity: 'Extra active')
      expect(u.save).to eq(true)
    end
  end

  context 'Association tests' do
    it { should have_many(:foods) }
  end
end
