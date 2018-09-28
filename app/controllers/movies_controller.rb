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
      if order.nil?
          order = session[:order]
          if order.nil?
              # hi
          else
              redirect_to movies_path(:order => session[:order])
          end
      else 
          session[:order] = order
      end
      @all_ratings = Movie.get_all_ratings
      @ratings = params[:ratings]
      @sort_by = nil
      if @ratings != nil
          session[:ratings] = @ratings
      else
          if session[:ratings].nil?
              @ratings = Hash[@all_ratings.collect { |item| [item, "1"] } ]
          else 
              @ratings = session[:ratings]
              #redirect_to movies_path(params[:ratings] => @ratings) 
          end
      end
      ratings = @ratings.keys
      
      if order == "title" 
          @movies = Movie.where({rating: ratings}).order(:title)
          @sort_by = :sort_by_title
      elsif  order == "release_date" 
          @movies = Movie.where({rating: ratings}).order(:release_date)
          @sort_by = :sort_by_release_date
      else
          @movies = Movie.where({rating: ratings})
      end 
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
