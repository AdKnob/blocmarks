class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

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

  def edit
    @user = current_user
    @topic = Topic.find(params[:id])
  end

  def update
    @user = current_user
    @topic = Topic.find(params[:id])
    @topic.title = params[:topic][:title]

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
