require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe Group, type: :model do
  context 'validation tests' do
    it "Shouldn't save if there's no name" do
      e = Group.new(icon: 'https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png')
      expect(e.save).to eq(false)
    end

    it "Shouldn't save if name is less than 3 characters" do
      e = Group.new(name: 'gr', icon: 'https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png')
      expect(e.save).to eq(false)
    end

    it "Shouldn't save if name is more than 15 characters" do
      e = Group.new(name: 'big huge group name', icon: 'https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png')
      expect(e.save).to eq(false)
    end

    it "Shouldn't save if name is already taken" do
      e1 = Group.new(name: 'vegetables', icon: 'https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png')
      e1.save
      e2 = Group.new(name: 'vegetables', icon: 'https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png')
      expect(e2.save).to eq(false)
    end

    it "Shouldn't save if icon is not in the correct format" do
      e = Group.new(name: 'vegetables', icon: 'https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.npg')
      expect(e.save).to eq(false)
    end

    it "Shouldn't save if icon is not a valid URL" do
      e = Group.new(name: 'vegetables',
                    icon: 'hppts://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png')
      expect(e.save).to eq(false)
    end

    it 'Should save if everything validates' do
      e = Group.new(name: 'vegetables', icon: 'https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png')
      expect(e.save).to eq(true)
    end
  end

  context 'Association tests' do
    it { should have_many(:foods) }
  end
end
