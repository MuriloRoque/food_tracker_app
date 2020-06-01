class FoodsController < ApplicationController
  before_action :all_groups, only: %i[new create]

  def index
    @foods = if params[:type] == 'grouped'
               Food.grouped_ones(current_user)
             else
               Food.ungrouped_ones(current_user)
             end
    @total = injection
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      if @food.group.nil?
        redirect_to foods_path
      else
        redirect_to foods_path(type: 'grouped')
      end
    else
      render :new
    end
  end

  def new
    @food = Food.new
  end

  def all_groups
    @groups = Group.all.order('name DESC')
  end

  private

  def food_params
    params.require(:food).permit(:author_id, :name, :amount, :group_id)
  end
end
