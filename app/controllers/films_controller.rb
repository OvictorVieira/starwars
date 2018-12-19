class FilmsController < ApplicationController
  before_action :film_by_api, only: [:index]

  def index
    @films = film_by_api
  end

  private

  def film_by_api
    begin
      response = call_swapi('?format=json')

      raise unless response.success?

      response['results']
    rescue
      flash[:warning] = I18n.t(:'messages.error.call_api_error')
    end
  end
end
