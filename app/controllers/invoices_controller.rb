class InvoicesController < ApplicationController
  def show
  end

  def new
    @invoice = Invoice.new
  end

  def create
    Invoice.create(invoice_params)
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update(invoice_params)
  end

  private

  def invoice_params
    params.require(:invoice).permit(:id, :reference, :description, :number,
                                    fields_attributes: [:id, :reference, :quantity, :_destroy])
  end

end
