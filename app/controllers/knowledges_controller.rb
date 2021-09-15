class KnowledgesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @knowledges = Knowledge.order("created_at DESC")
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

  private

  def knowledge_params
    params.require(:knowledge).permit(:knowledge_title, :knowledge_info, :image).merge(user_id: current_user.id)
  end
end
