class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket
  # POST /comments
  def create
    @comment = @ticket.comments.build(comment_params)
    @comment.user  = current_user
    if @comment.save
      render json: @comment.to_json(include:  {user: {only: [:id,:name]}}), status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end


  private

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:description)
  end


  def set_ticket
    @ticket  =  Ticket.accessible_by(current_ability).find(params[:ticket_id])
  end
end
