class FoodsController < ApplicationController
  def index
    @foods = Food.all.order('created_at DESC')
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def new
    @food = Food.new
  end

  private

  def food_params
    params.require(:food).permit(:author_id, :name, :amount)
  end
end
