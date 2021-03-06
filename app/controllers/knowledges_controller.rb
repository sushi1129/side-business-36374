class KnowledgesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_knowledge, only: [:show, :edit, :update, :destroy]

  def index
    @knowledges = Knowledge.order('created_at DESC')
    @knowledge = Knowledge.all
  end

  def new
    @knowledge = Knowledge.new
  end

  def create
    @knowledge = Knowledge.create(knowledge_params)
    if @knowledge.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @knowledge_comments = @knowledge.knowledge_comments.includes(:user)
    @knowledge_comment = KnowledgeComment.new
    @knowledge_good = KnowledgeGood.new
    @knowledge_bad = KnowledgeBad.new
  end

  def edit
  end

  def update
    if @knowledge.update(knowledge_params)
      redirect_to knowledge_path(@knowledge.id)
    else
      render :edit
    end
  end

  def destroy
    @knowledge.destroy
    redirect_to root_path
  end

  private

  def knowledge_params
    params.require(:knowledge).permit(:knowledge_title, :knowledge_info, :image).merge(user_id: current_user.id)
  end

  def set_knowledge
    @knowledge = Knowledge.find(params[:id])
  end
end
