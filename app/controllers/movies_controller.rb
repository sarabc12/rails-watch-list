class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @bookmark = Bookmark.new
    @list = List.new
  end

  def update
    @movie = Movie.find(params[:id])
    @count = params[:movie][:list_ids].count - 1
    params[:movie][:list_ids].each do |id|
      next if id == ""
      @bookmark = Bookmark.new
      @list = List.find(id)
      if Bookmark.find_by(list_id: id, movie_id: @movie.id)
        @coiso = Bookmark.find_by(list_id: id, movie_id: @movie.id)
        # raise
        Bookmark.destroy(@coiso.id)
      end
      @bookmark.list = @list
      @bookmark.movie = @movie
      # raise


      # raise
      @count -=  1
      if @bookmark.save! && @count == 0
        redirect_to lists_path
      else
        if @count == 0
          render :show, status: :unprocessable_entity
        end
      end

      # raise
    end
    # redirect_to lists_path
  end
end

  # @list = List.find(params[:movie][:list_ids].last)
