# frozen_string_literal: true

class ExercisesController < ApplicationController
  before_action :authenticate_user!

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find_by_id(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to exercises_path, notice: 'The exercise was created successfully.'
    else
      render 'new'
    end
  end

  def edit
    @exercise = Exercise.find_by_id(params[:id])
  end

  def update
    @exercise = Exercise.find_by_id(params[:id])
    if @exercise.update(exercise_params)
      redirect_to exercises_path, notice: 'Exercise updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @exercise = Exercise.find_by_id(params[:id])
    @exercise.destroy
    redirect_to exercises_path, notice: 'Exercise deleted successfully.'
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :description)
  end
end
