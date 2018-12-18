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
end
