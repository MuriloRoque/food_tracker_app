class GroupsController < ApplicationController
  def index
    @groups = Group.all.order('name DESC')
  end

  def show
    @foods = Food.where(group_id: params[:id])
    @total = @foods.inject(0){|sum, hash| sum + hash[:amount] }
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group)
    else
      @group.icon = params[:icon] || "https://data.whicdn.com/images/182762798/original.gif"
      if @group.save
        redirect_to group_path(@group)
      else
        render :new
      end
    end
  end

  def new
    @group = Group.new
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
