# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @workouts = current_user.workouts
                            .by_current_week
                            .group_by_day_of_week(:date, format: "%a", week_start: :monday)
                            .count
  end
end
