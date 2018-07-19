class Client::ProductsController < ApplicationController
  def index
    # user_input = params[:client_search]
    # # category = params[:]
    # response = Unirest.get("http://localhost:3000/api/products",
    #   parameters: {
    #     api_search: user_input,
    #     category: params[:category]
    #   }
    # )
    # @products = response.body
    client_params = {
      api_search: params[:api_search],
      sort_by: params[:client_sort_by],
      category: params[:category]
    }
    response = Unirest.get("http://localhost:3000/api/products",
      parameters: client_params
    )
    @products = response.body
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    client_params = {
        input_name: params[:input_name],
        input_description: params[:input_description],
        input_price: params[:input_price],
        input_stocked: params[:input_stocked],
        input_supplier_id: params[:input_supplier_id]
      }
    response = Unirest.post("http://localhost:3000/api/products",
      parameters: client_params
      )
    flash[:success] = "You made a new product!"
    redirect_to "/client/products"
  end
  
  def show
    response_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{response_id}")
    @product = response.body
    render "show.html.erb"
  end

  def edit
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render "edit.html.erb"
  end

  def update
    client_params = {
      input_name: params[:input_name],
      input_description: params[:input_description],
      input_price: params[:input_price],
      input_stocked: params[:input_stocked],
      input_image_url: params[:input_image_url]

    }
    response = Unirest.patch("http://localhost:3000/api/products/#{params[:id]}",
      parameters: client_params)
    
    flash[:success] = "You changed a product"
    redirect_to "/client/products/#{params[:id]}"
  end

  def destroy
    response = Unirest.delete("http://localhost:3000/api/products/#{params[:id]}")
    flash[:danger] = "You deleted a recipe"
    redirect_to "/client/products"
  end

end
