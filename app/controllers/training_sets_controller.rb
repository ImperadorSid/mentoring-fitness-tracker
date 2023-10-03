# frozen_string_literal: true

class TrainingSetsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_workout

  def new
    @training_set = @workout.training_sets.build
  end

  def create
    @training_set = @workout.training_sets.build(set_params)
    if @training_sets.save
      redirect_to @workout, notice: 'The set was created successfully.'
    else
      render 'new'
    end
  end

  def edit
    @training_set = @workout.training_sets.find_by_id(params[:id])
  end

  def update
    @training_set = @workout.training_sets.find_by_id(params[:id])
    if @training_set.update(set_params)
      redirect_to @workout, notice: 'The set has been updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @training_set = @workout.training_sets.find_by_id(params[:id])
    @training_set.destroy
    redirect_to @workout, notice: 'Set deleted successfully.'
  end

  private

  def set_params
    params.require(:training_sets).permit(:exercise_id, :repetitions, :weight)
  end

  def find_workout
    @workout = current_user.workouts.find_by_id(params[:workout_id])
  end
end
