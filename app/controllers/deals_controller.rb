class DealsController < ApplicationController
    def new
        @product = Product.find(params[:product_id])
        @deal = Deal.new
    end

    def create
        @product = Product.find(params[:product_id])
        @deal = @product.build_deal(deal_params)
        @deal.save
        redirect_to @product, notice: 'Processo de compra iniciado'
    end

    private

    def deal_params
        params.require(:deal).permit(:user_id)
    end
end