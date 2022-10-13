class MoviesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
  wrap_parameters format: {}
  
  def index
    movies = Movie.all
    render json: movies
  end

  def create
    # using create! to invoke EXCEPTIONS and render error when data is invalid
    movie = Movie.create!(movie_params)
    render json: movie, status: :created
  end

  private

  def movie_params
    params.permit(:title, :year, :length, :director, :description, :poster_url, :category, :discount, :female_director)
  end

  def render_invalid_response(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
  
end
