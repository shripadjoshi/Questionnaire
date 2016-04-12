class QuestionTypesController < ApplicationController
  before_action :set_question_type, only: [:edit, :update, :destroy]
  add_breadcrumb "Home", :root_path

  # GET /question_types
  # GET /question_types.json
  def index
    question_type_breadcrums({})
    @question_types = QuestionType.all
  end

  # GET /question_types/new
  def new
    question_type_breadcrums({"display_text": "New Question type"})
    @question_type = QuestionType.new
  end

  # GET /question_types/1/edit
  def edit
    question_type_breadcrums({"display_text": "Edit Question type"})
  end

  # POST /question_types
  # POST /question_types.json
  def create
    question_type_breadcrums({"display_text": "Create Question type"})
    @question_type = QuestionType.new(question_type_params)

    respond_to do |format|
      if @question_type.save
        format.html { redirect_to question_types_url, notice: 'Question type was successfully created.' }
        format.json { render :index, status: :created, location: @question_type }
      else
        format.html { render :new }
        format.json { render json: @question_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_types/1
  # PATCH/PUT /question_types/1.json
  def update
    question_type_breadcrums({"display_text": "Update Question type"})
    respond_to do |format|
      if @question_type.update(question_type_params)
        format.html { redirect_to question_types_url, notice: 'Question type was successfully updated.' }
        format.json { render :index, status: :ok, location: @question_type }
      else
        format.html { render :edit }
        format.json { render json: @question_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_types/1
  # DELETE /question_types/1.json
  def destroy
    @question_type.destroy
    respond_to do |format|
      format.html { redirect_to question_types_url, notice: 'Question type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_type
      @question_type = QuestionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_type_params
      params.require(:question_type).permit(:name)
    end

    def question_type_breadcrums(breadcrums_data)
      add_breadcrumb "Question Types", :question_types_path
      if breadcrums_data.present?
        add_breadcrumb breadcrums_data[:display_text]
      end
    end

end
