module FoodsHelper
  def injection
    @foods.inject(0) { |sum, hash| sum + hash[:amount] }
  end

  def user_injection
    Food.daily.where(author_id: @user.id).inject(0) { |sum, hash| sum + hash[:amount] }
  end
end
