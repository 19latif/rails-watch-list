class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new

  end

  def create
    @bookmarks = Bookmark.new(bookmarks_params)
    @bookmarks.save
    @list = List.find(params[:list_id])
    @bookmarks.list = @list
    redirect_to bookmarks_path(@list)
  end

  private

  def bookmarks_params
    params.require(:bookmarks).permit(:comment, :movie_id)
  end
end
