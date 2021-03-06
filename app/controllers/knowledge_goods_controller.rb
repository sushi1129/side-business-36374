class KnowledgeGoodsController < ApplicationController
  def create
    if @knowledge_bad = KnowledgeBad.find_by(user_id: current_user.id, knowledge_id: params[:knowledge_id])
      @knowledge_bad.destroy
    end
    @knowledge_good = current_user.knowledge_goods.create(knowledge_id: params[:knowledge_id])
    redirect_back(fallback_location: knowledge_path(@knowledge_good.knowledge))
  end

  def destroy
    @knowledge_good = KnowledgeGood.find_by(knowledge_id: params[:knowledge_id], user_id: current_user.id)
    @knowledge_good.destroy
    redirect_back(fallback_location: knowledge_path(@knowledge_good.knowledge))
  end
end
