class FilmsController < ApplicationController
  before_action :film_by_api, only: [:index]

  def index
    begin
      response = call_swapi('?format=json')

      raise unless response.success?

      @films = response['results']
    rescue
      flash[:warning] = I18n.t(:'messages.error.call_api_error')
    end
  end

  def show

  end

  private

  def film_by_api

  end
end
