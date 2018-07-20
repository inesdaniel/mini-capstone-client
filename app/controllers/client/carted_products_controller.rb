class Client::CartedProductsController < ApplicationController
  def new
    render "new.html.erb"
  end

  def create
    client_params = {
        input_product_id: params[:input_product_id],
        input_quantity: params[:input_quantity]
      }
    response = Unirest.post("http://localhost:3000/api/carted_products",
      parameters: client_params
      )
    @carted_product = response.body
    flash[:success] = "You added to your cart!"
    render "show.html.erb"
  end
end
