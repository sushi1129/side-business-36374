class KnowledgeCommentsController < ApplicationController
  def create
    @knowledge_comment = KnowledgeComment.new(knowledge_comment_params)
    if @knowledge_comment.save
      redirect_to knowledge_path(@knowledge_comment.knowledge)
    else
      @knowledge = @knowledge_comment.knowledge
      @knowledge_comment = @knowledge.knowledge_comment
      render 'knowledge/show'
    end
  end

  def destroy
    @knowledge = Knowledge.find(params[:knowledge_id])
    @knowledge_comment = KnowledgeComment.find(params[:id])
    @knowledge_comment.destroy
    redirect_to knowledge_path(@knowledge_comment.knowledge)
  end

  private

  def knowledge_comment_params
    params.require(:knowledge_comment).permit(:text).merge(user_id: current_user.id, knowledge_id: params[:knowledge_id])
  end
end
