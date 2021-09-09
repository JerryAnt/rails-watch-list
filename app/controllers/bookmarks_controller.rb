class BookmarksController < ApplicationController
  def new
  # A user can add a new bookmark (movie/list pair) to an existing list
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: 'The bookmark was successfully created'
    else
      render 'new'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmark_path(@bookmark), notice: 'The bookmark was successfully deleted'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment, :list_id, :movie, :list)
  end
end