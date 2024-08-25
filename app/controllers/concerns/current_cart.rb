module CurrentCart
  private

  # def set_cart
  #   @cart = Cart.find_by(id: 21) || Cart.create
  # end
  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:card_id] = @cart.id
  end
end
