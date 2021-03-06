class QuestionsController < ApplicationController
  before_action :authorize_user, only: [:edit, :update, :destroy] 
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_filter :cache_question, only: [:create]
  before_filter :authenticate_user!, :except => [:new, :index, :show]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    # @question = current_user.questions.build
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    #@question = Question.new(question_params)
    @question = current_user.questions.build(question_params)
    session[:question_cached] = nil
    respond_to do |format|
      if @question.save
        format.html { redirect_to action: "index" , notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text,:prize)
    end
    def authorize_user
      @question = current_user.questions.find_by(id: params[:id])
      redirect_to questions_path, notice: "Not authorized" if @question.nil?
    end

    def cache_question
      session[:question_cached] = question_params
    end
end
