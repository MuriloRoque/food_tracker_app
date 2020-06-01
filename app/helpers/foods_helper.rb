module FoodsHelper
  def injection
    @foods.inject(0){|sum, hash| sum + hash[:amount] }
  end
end
