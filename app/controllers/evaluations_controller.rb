class EvaluationsController < ApplicationController

  def index
  end

  def create

  end

  def update

    binding.pry
  end

  private

  def evaluations_params
    params.permit(:like, :dislike)
  end
end
