class KnowledgeBadsController < ApplicationController
  def create
    @knowledge_bad = current_user.knowledge_bads.create(knowledge_id: params[:knowledge_id])
    redirect_back(fallback_location: knowledge_path(@knowledge_bad.knowledge))
  end

  def destroy
    @knowledge_bad = KnowledgeBad.find_by(knowledge_id: params[:knowledge_id], user_id: current_user.id)
    @knowledge_bad.destroy
    redirect_back(fallback_location: knowledge_path(@knowledge_bad.knowledge))
  end
end
