class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update]

  def show
  end

  def new
    @invoice = Invoice.new
    @entities = Entity.all
  end

  def create
    @invoice = Invoice.create(invoice_params)
    respond_to do |format|
      format.json { render json: @invoice, location: @invoice }
    end
  end

  def edit
  end

  def update
    @invoice.update(invoice_params)
    respond_to do |format|
      format.json { render json: @invoice, location: @invoice }
    end
  end

  private

  def invoice_params
    params.require(:invoice)
          .permit(:id, :reference, :description, :number,
          :total_ht, :total_ttc, :total_tva, :tva, :entity_id,
          fields_attributes: [:id, :reference, :quantity, :unit_price, :_destroy])
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

end
