class FilmsController < ApplicationController
  before_action :film_by_api, only: [:index]

  include HTTParty

  base_uri 'https://swapi.co/api/films?'

  def index
    @films = Film.all
  end

  private

  def film_by_api
    response = call_swapi

    raise response.response unless response.success?

    create_film(response['results'])
  end

  def call_swapi
    self.class.get('format=json')
  end

  def create_film(films)
    films.each do |film|
      film_api_id = film['url'].gsub(/[^0-9]+/, '')
      next if Film.find_by(api_id: film_api_id)

      film_params = {
        title: film['title'],
        episode: film['episode_id'],
        director: film['director'],
        release_date: film['release_date'],
        api_id: film_api_id
      }
      Film.create!(film_params)
    end
  end

  def find_specific_film(film_id)
    self.class.get(film_id)
  end
end
