class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
    redirect_to bookmark_path(@bookmark), notice: 'The bookmark was successfully created'
    else
      render :new
    end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path, notice: 'The bookmark was successfully deleted'
  end

  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment, :list_id)
  end
end
