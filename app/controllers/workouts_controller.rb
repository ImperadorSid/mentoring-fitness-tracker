# frozen_string_literal: true

class WorkoutsController < ApplicationController
  before_action :authenticate_user!

  def index
    @workouts = current_user&.workouts
  end

  def show
    @workout = current_user.workouts.find_by_id(params[:id])
  end

  def new
    @workout = current_user.workouts.build
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to @workout, notice: 'Training was created successfully.'
    else
      render 'new'
    end
  end

  def edit
    @workout = current_user.workouts.find_by_id(params[:id])
  end

  def update
    @workout = current_user.workouts.find_by_id(params[:id])
    if @workout.update(workout_params)
      redirect_to @workout, notice: 'Training updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @workout = current_user.workouts.find_by_id(params[:id])
    @workout.destroy
    redirect_to workouts_path, notice: 'Training deleted successfully.'
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :date)
  end
end
