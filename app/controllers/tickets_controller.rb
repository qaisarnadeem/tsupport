class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket , only: [:show,:change_status]


  def index
    options = {status: {} , query: {} , order: {created_at: :desc} , page: params[:page] || 1}
    options[:status] = {status: params[:status]} if params[:status].present?
    options[:query] = ["tickets.title like ? or tickets.description like ? ","%#{params[:q]}%", "%#{params[:q]}%"] if params[:q].present?
    @tickets = Ticket.accessible_by(current_ability).includes(:resolved_by).where(options[:status]).where(options[:query]).
        select(:id , :user_id , :title , :description,:status , :created_at , :resolved_by_id).order(options[:order]).
        page(options[:page]).per(12)

    if params[:pdf]
      html=<<HTML
      <div class="table-responsive" *ngIf="tickets.length">
    <table class="table">
        <thead>
        <tr>
            <th style='width:200px'>Title</th>
            <th style='width:200px'>Description</th>
            <th style='width:200px'>Date</th>
            <th style='width:200px'>Status</th>
            <th style='width:200px'>Resolved By</th>
        </tr>
        </thead>
        <tbody>
HTML
      @tickets.each do |ticket|
        html += "<tr style='width: 1000px;'> <td style='width:200px'>#{ticket.title}</td>" +
            "<td style='width:200px'>#{ticket.description}</td>" +
            "<td style='width:200px'>#{ticket.created_at.strftime("%e %B, %Y")}</td>" +
            "<td style='width:200px'>#{ticket.status}</td>" +
            "<td style='width:200px'>#{ticket.resolved_by&.name}</td></tr>"
      end
      html +="</tbody></table></div>"
      pdf = WickedPdf.new.pdf_from_string(html);
      send_data pdf, :filename => 'report.pdf', :type => 'application/pdf', :disposition => 'attachment'
    end
    render json: {tickets: @tickets,total: @tickets.total_count , page: params[:page]} unless params[:pdf]
  end


  def create
    @ticket = current_user.tickets.build(ticket_params)
    if @ticket.save
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @ticket.to_json(only: [:id,:description , :title , :created_at , :status],include: {user: {only: [:name , :id]},
                                                                                                     resolved_by: {only: [:name]},comments: {only: [:id , :description , :created_at] , include: {user: {only: [:name , :id]}}}})
  end

  def change_status
    @ticket.status = params[:status]
    @ticket.resolved_by =  current_user if @ticket.resolved?
    @ticket.save!
    render json: @ticket
  end


  private

  def ticket_params
    params.require(:ticket).permit(:title , :description)
  end

  def set_ticket
    @ticket  =  Ticket.accessible_by(current_ability).find(params[:id])
  end
end
