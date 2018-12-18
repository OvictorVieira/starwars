class FilmsController < ApplicationController
  before_action :film_by_api, only: [:index]

  include HTTParty

  base_uri 'https://swapi.co/api/films?'

  def index
    @films = film_by_api
  end

  private

  def film_by_api
    response = call_swapi

    raise response.response unless response.success?

    response['results']
  end

  def call_swapi
    self.class.get('format=json')
  end

  def find_specific_film(film_id)
    self.class.get(film_id)
  end
end
