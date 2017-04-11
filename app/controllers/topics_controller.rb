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
end
