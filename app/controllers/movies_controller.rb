class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @bookmark = Bookmark.new
    @list = List.new
  end

  def update
    @movie = Movie.find(params[:id])
    @list = List.find(params[:movie][:list_ids].last)
    @bookmark = Bookmark.new
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render show, status: :unprocessable_entity
    end
    # raise
  end
end
