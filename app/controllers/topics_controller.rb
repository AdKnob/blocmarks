class TopicsController < ApplicationController

  before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = current_user.topics.new(topic_params)
    authorize @topic
    if @topic.save
      flash[:notice] = "Topic was successfully created!"
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error creating the Topic"
      render :new
    end
  end

  def destroy
    authorize @topic
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "Topic was deleted successfully"
      redirect_to topics_index
    else
      flas.now[:alert] = "There was an error deleting the post"
      render :show
    end
  end

  def edit
    authorize @topic
    @topic = Topic.find(params[:id])
  end

  def update
    authorize @topic
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      flash[:success] = "Topic was updated successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "Error saving topic. Please try again."
      render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
