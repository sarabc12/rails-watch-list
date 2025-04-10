class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @movies = Movie.order("RANDOM()").limit(20)
    @movies = @movies.search_by_title(params[:query]) if params[:query].present?
  end

  def lists
    @lists = List.all
  end

  def show
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
    # @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_index_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end


  def list_params
    params.require(:list).permit(:name, :description, :photo)
  end

end
