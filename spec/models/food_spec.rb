require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe Food, type: :model do
  context 'validation tests' do
    it "Shouldn't save if there's no name" do
      e = Food.new(amount: 500)
      expect(e.save).to eq(false)
    end

    it "Shouldn't save if name is less than 3 characters" do
      e = Food.new(name: 'ba', amount: 500)
      expect(e.save).to eq(false)
    end

    it "Shouldn't save if name is more than 15 characters" do
      e = Food.new(name: 'banana nanica caseira', amount: 500)
      expect(e.save).to eq(false)
    end

    it "Shouldn't save if there's no amount" do
      e = Food.new(name: 'banana')
      expect(e.save).to eq(false)
    end

    it "Shouldn't save if the amount is more than 5000" do
      e = Food.new(name: 'banana', amount: 6000)
      expect(e.save).to eq(false)
    end
  end

  context 'Association tests' do
    it { should belong_to(:author) }
  end
end
