class QuestionsController < ApplicationController
  def index
    @questions = Question.all

  end

  def show
    @question = question.find(params[:id])
  end

  def new
    @question = question.new
  end

  def create
    @question = question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]

    if @question.save
        flash[:notice] = "question was saved."
        redirect_to @question
    else
      flash.now[:alert] = "There was an error saving your question. Please try again."
      render :new
    end
  end

  def edit
    @question = question.find(params[:id])
  end

  def update
    @question = question.find(params[:id])
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params [:question][:resolved]

    if @question.save
      flash[:notice] = "Question was updated."
      redirect_to @question
    else
      flash.now[:alert] = "There was an error saving the question. Please try again."
      render :edit
    end
  end

  def destroy
    @question = question.find(params[:id])

    if @question.destroy
      flash[:notice] = "\"#{@question.title}\" was deleted successfully."
      redirect_to questions_path
    else
      flash.now[:alert] = "There was an error deleting the question."
      render :show
    end
  end
end
