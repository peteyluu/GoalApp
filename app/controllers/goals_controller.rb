class GoalsController < ApplicationController
  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      flash[:notice] = "Goal saved!"
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find_by_id(params[:id])
    render :show
  end

  def index
    @goals = Goal.all
    render :index
  end

  def edit
    @goal = Goal.find_by_id(params[:id])
    render :edit
  end

  def update
    @goal = Goal.find_by_id(params[:id])
    @goal.update_attributes(goal_params)
    redirect_to goal_url(@goal)
  end

  def destroy
    @goal = Goal.find_by_id(params[:id])
    @goal.destroy
    redirect_to goals_url
  end

  def complete
    @goal = Goal.find_by_id(params[:id])
    if @goal.completed == false
      @goal.completed = true
    else
      @goal.completed = false
    end
    redirect_to goal_url(@goal)
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :details, :private, :completed)
  end
end
