class BookmarksController < ApplicationController

  before_action :set_topic

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @topic.bookmarks.new(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was successfully created!"
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error creating the Bookmark"
      render :new
    end
  end

  def destroy
    @bookmark = @topic.bookmarks.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "Bookmark was successfully created!"
    else
      flash.now[:alert] = "There was an error creating the Bookmark"
    end

    redirect_to @topic
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])  # [@topic, @bookmark] ==> topic_bookmark_path(@topic, @bookmark)
  end

end
