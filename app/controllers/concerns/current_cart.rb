module CurrentCart
  private

  # def set_cart
  #   @cart = Cart.find_by(id: 51) || Cart.create
  # end
  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
