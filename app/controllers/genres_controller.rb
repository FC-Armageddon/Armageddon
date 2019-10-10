class GenresController < ApplicationController
  def create
  	genre = Genre.new
  	genre.save
  end

  def update
  end

  private

  def genre_params
  	params.require(:genre).permit(:genre)
end
