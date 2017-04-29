class BookmarksController < ApplicationController

  before_action :set_topic
  before_action :authenticate_user!

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    authorize @bookmark
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
    authorize @bookmark
    @bookmark = @topic.bookmarks.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Bookmark was successfully created!"
    else
      flash.now[:alert] = "There was an error creating the Bookmark"
    end

    redirect_to @topic
  end

  def edit
    authorize @bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    authorize @bookmark
    @bookmark = @topic.bookmarks.find(params[:id])
    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark was updated successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "Error saving bookmark. Please try again."
      render :edit
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])  # [@topic, @bookmark] ==> topic_bookmark_path(@topic, @bookmark)
    authorize @topic
  end

end
