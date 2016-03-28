class TopicsController < ApplicationController

  add_breadcrumb "Home", :root_path
  before_filter :authenticate_user!
  before_action :set_topic, only: [:edit, :update, :destroy]
  before_action :get_categories, only: [:new, :create, :edit, :update]


  # GET /topics
  # GET /topics.json
  def index
    topic_breadcrums({})
    @topics = Topic.all
  end

  # GET /topics/new
  def new
    topic_breadcrums({"display_text": "New Topic"})
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
    topic_breadcrums({"display_text": "Edit Topic"})
  end

  # POST /topics
  # POST /topics.json
  def create
    topic_breadcrums({"display_text": "Create Topic"})
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to topics_url, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    topic_breadcrums({"display_text": "Update Topic"})
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to topics_url, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def topic_params
    params.require(:topic).permit(:category_id, :name)
  end

  def topic_breadcrums(breadcrums_data)
    add_breadcrumb "Topics", :topics_path
    if breadcrums_data.present?
      add_breadcrumb breadcrums_data[:display_text]
    end
  end

  def get_categories
    @categories = Category.all
  end
end
