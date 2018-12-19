module FilmsHelper

  def date_format_year(date)
    date.to_time.strftime('%d/%m/%Y')
  end

  def format_api_id(url)
    url.gsub(/[^0-9]+/, '')
  end

  def find_evaluation_by_film_api_id(film_api_id)
    Evaluation.find_by(film_api_id: film_api_id, user_id: current_user.id)
  end
end
