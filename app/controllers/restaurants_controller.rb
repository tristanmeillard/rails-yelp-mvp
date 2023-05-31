class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
    redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end

end

# class TasksController < ApplicationController
#   def index
#     @tasks = Task.all
#   end

#   def show
#     @task = Task.find(params[:id])
#   end

#   def new
#     @task = Task.new
#   end

#   def create
#     @task = Task.new(task_params)
#     @task.save
#     redirect_to task_path(@task)
#   end

#   def edit
#     @task = Task.find(params[:id])
#   end

#   def update
#     @task = Task.find(params[:id])
#     @task.update(task_params)
#     redirect_to task_path(@task)
#   end

#   def destroy
#     @task = Task.find(params[:id])
#     @task.destroy
#     redirect_to tasks_path, status: :see_other
#   end

#   private

#   def task_params
#     params.require(:task).permit(:title, :details, :completed)
#   end

# end
