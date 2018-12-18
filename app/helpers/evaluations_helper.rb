module EvaluationsHelper

  def liked?(film_api_id)
    evaluation = define_evaluation(film_api_id)

    evaluation.like? ? 'text-success' : 'text-dark'
  end

  def disliked?(film_api_id)
    evaluation = define_evaluation(film_api_id)

    evaluation.dislike? ? 'text-danger' : 'text-dark'
  end

  def define_evaluation(film_api_id)
    Evaluation.find_by(film_api_id: film_api_id)
  end

  def find_evaluation(film_api_id)
    Evaluation.where(film_api_id: film_api_id, user_id: current_user.id)
  end

  def max_evaluation_num
    Evaluation::MAX_EVALUATION
  end
end
