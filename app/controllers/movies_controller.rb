class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
      order = params[:order]
      if order == "title"
          @movies = Movie.order(:title)
      elsif  order == "release_date"
          @movies = Movie.order(:release_date)
      else
          @movies = Movie.all
      end
      # expects the variable @all_ratings to be an enumerable collection of all 
      # possible values of a movie rating
      # hash method for key/value pairs? for both all_ratings and ratings
      #@all_ratings = Movie.get_all_ratings... ?
      #@ratings = @ratings.
      #Check if ratings/which rating boxes have been checked
      #if ratings boxes have been checked
      #do this
      #else NO rating boxes have been checked
      #ratings gets all ratings from  every movie/lists all the movies 
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
