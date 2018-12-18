class EvaluationsController < ApplicationController

  before_action :sanitize_evaluation_params, only: [:create, :update]

  def create
    evaluation = Evaluation.create(evaluations_params)

    if evaluation.save
      flash[:success] = I18n.t(:'messages.success.evaluation_success')
    else
      flash[:error] = I18n.t(:'messages.error.evaluation_fail')
    end

    redirect_to root_url
  end

  def update
    params = evaluations_params

    evaluation = Evaluation.find_by(film_api_id: params[:film_api_id])

    if evaluation.update(evaluation: params[:evaluation])
      flash[:success] = I18n.t(:'messages.success.update_evaluation_succes')
    else
      flash[:error] = I18n.t(:'messages.error.update_evaluation_fail')
    end

    redirect_to root_url
  end

  def destroy
    params = evaluations_params

    if Evaluation.delete(params[:film_api_id])
      flash[:success] = I18n.t(:'messages.success.update_evaluation_succes')
    else
      flash[:error] = I18n.t(:'messages.error.update_evaluation_fail')
    end

    redirect_to root_url
  end

  private

  def sanitize_evaluation_params
    params[:evaluation] = params[:evaluation].to_i
    params[:user_id] = current_user.id
  end

  def evaluations_params
    params.permit(:film_api_id, :evaluation, :user_id)
  end
end
