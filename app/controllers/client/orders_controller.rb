class Client::OrdersController < ApplicationController
  def show
    order_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/orders/#{order_id}")
    @order = response.body
    render "show.html.erb"
  end  

  def create
    response= Unirest.post("http://localhost:3000/api/orders",
      parameters: {
        product_id: params[:product_id],
        quantity: params[:quantity]
      }
    )
    order = response.body
    redirect_to "/client/orders/#{order['id']}"
  end
end
