class RatingsController < ApplicationController
  before_action :set_ratings, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
  end
  def new
    @rating = Rating.new
    @beers = Beer.all
  end
  def create
   Rating.create params.require(:rating).permit(:beer_id, :score)
    redirect_to ratings_path
  end
  def destroy
byebug
     rating = Rating.find(params[:id])
     rating.delete
     redirect_to ratings_path
  end
end