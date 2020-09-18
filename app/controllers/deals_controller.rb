class DealsController < ApplicationController
    def new
        @product = Product.find(params[:product_id])
        if current_user.profile == nil
            redirect_to product_path(@product.id), notice: 'Você precisa criar um perfil para fazer uma compra'
        else
        @deal = Deal.new
        end
    end

    def create
        @product = Product.find(params[:product_id])
        @deal = @product.build_deal(deal_params)
        @deal.save
        @product.unavailable!
        
        redirect_to @product, notice: 'Processo de compra iniciado'
    end

    def update
        @deal = Deal.find(params[:id])
        @deal.update(deal_params)
        if @deal.closed?
            @deal.product.sold!
            redirect_to @deal.product, notice: 'Venda confirmada!'
        else
            redirect_to @deal.product
        end
    end

    def edit
        @deal = Deal.find(params[:id])
    end

    private

    def deal_params
        params.require(:deal).permit(:user_id, :status)
    end
end