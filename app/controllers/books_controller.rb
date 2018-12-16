class BooksController < ApplicationController
  include HTTParty

  base_uri 'https://swapi.co/api/films?'

  def index
    response = self.class.get('format=json')

    if response.success?
      @books = response['results']
    else
      raise response.response
    end
  end

  def update
  end

  private

  def book_params
    params.permit(:like, :dislike)
  end
end
