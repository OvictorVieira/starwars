class EvaluationsController < ApplicationController

  before_action :sanitize_evaluation_params, only: [:create, :update]
  before_action :exceeded_amount_evaluation?, only: [:create]

  def create
    evaluation = Evaluation.create(evaluations_params)

    if evaluation.save
      flash[:success] = I18n.t(:'messages.success.evaluation_success')
    else
      flash[:error] = I18n.t(:'messages.error.evaluation_fail')
    end

    redirect_user
  end

  def update
    params = evaluations_params

    evaluation = Evaluation.find_by(film_api_id: params[:film_api_id])

    if evaluation.update(evaluation: params[:evaluation])
      flash[:success] = I18n.t(:'messages.success.update_evaluation_succes')
    else
      flash[:error] = I18n.t(:'messages.error.update_evaluation_fail')
    end

    redirect_user
  end

  def destroy
    params = evaluations_params

    if Evaluation.destroy(params[:evaluation_id])
      flash[:success] = I18n.t(:'messages.success.update_evaluation_succes')
    else
      flash[:error] = I18n.t(:'messages.error.update_evaluation_fail')
    end

    redirect_user
  end

  private

  def sanitize_evaluation_params
    params[:evaluation] = params[:evaluation].to_i
    params[:user_id] = current_user.id
  end

  def evaluations_params
    params.permit(:film_api_id, :evaluation, :user_id, :evaluation_id)
  end

  def exceeded_amount_evaluation?
    evaluations_user = Evaluation.where(user_id: current_user.id)

    if evaluations_user.length >= Evaluation::MAX_EVALUATION
      flash[:warning] = I18n.t(:'messages.error.update_evaluation_exceeded')
      redirect_user
    end
  end

  def redirect_user
    redirect_to root_url
  end
end
