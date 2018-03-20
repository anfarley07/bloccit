class TopicsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]
  before_action :authorize_moderator, except: [:index, :show, :edit, :update]



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
     @topic =Topic.new(topic_params)

     if @topic.save
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash.now[:alert] = "Error creating topic. Please try again."
       render :new
     end
   end

   def edit
     @topic = Topic.find(params[:id])
   end

   def update
     @topic = Topic.find(params[:id])

     if @topic.update(topic_params)
       flash[:notice] = "Topic was updated."
       redirect_to @topic
     else
       flash.now[:alert] = "Error saving topic. Please try again"
       render :edit
     end
   end

   def destroy
     @topic = Topic.find(params[:id])

     if @topic.destroy
       flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the topic."
       render :show
     end
   end

   #remember anything not private must be above this
   private
   def topic_params
     params.require(:topic).permit(:name, :description, :public)
   end

   def authorize_user
     if current_user.member?
       flash[:alert] = "You must be an admin or moderator to do that."
       redirect_to topics_path
     end
  end

  def authorize_moderator
     if current_user.moderator?
       flash[:alert] = "You must be an admin to do that."
       redirect_to new_session_path
     end
   end
 end
