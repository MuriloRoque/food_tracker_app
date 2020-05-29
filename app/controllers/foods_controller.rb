class FoodsController < ApplicationController
  def index
    if params[:type] == 'grouped'
      @foods = Food.where(group_id: true)
    else
      @foods = Food.where(group_id: nil)
    end
    @total = @foods.inject(0){|sum, hash| sum + hash[:amount] }
  end

  def create
    @groups = Group.all.order('name DESC')
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def new
    @food = Food.new
    @groups = Group.all.order('name DESC')
  end

  private

  def food_params
    params.require(:food).permit(:author_id, :name, :amount, :group_id)
  end
end
