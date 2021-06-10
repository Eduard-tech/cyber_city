class PaymentsController < ApplicationController
  def new
    @cart = current_user.cart
    @total = 0
    @cart.products.each do |product|
      @total += product.price_cents
    end
    @total
  end
end
