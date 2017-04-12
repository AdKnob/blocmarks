class TopicsController < ApplicationController
  def index
    @topic = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic.title = params[:topic][:title]
    if @topic.save
      flash[:notice] = "Topic was successfully created!"
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error creating the Topic"
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "Topic was deleted successfully"
      redirect_to topics_index
    else
      flas.now[:alert] = "There was an error deleting the post"
      render :show
  end
end
