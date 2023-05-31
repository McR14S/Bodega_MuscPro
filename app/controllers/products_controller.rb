class ProductsController < ApplicationController
    skip_before_action :protect_pages, only: [:index, :show]

    def index
        @categories = Category.order(name: :asc).load_async
        #parametro filtrado de productos
        @pagy, @products = pagy_countless(FindProducts.new.call(product_params_index).load_async, items: 12)
            
        render 'index'
    end

    #Mostramos producto
    def show
        product
    end

    #Nuevo producto
    def new
        @product = Product.new
    end

    #Creamos un nuevo producto
    def create
        @product = Product.new(product_params)

        if @product.save
            redirect_to products_path, notice: t('.created')
        else 
            render :new, status: :unprocessable_entity
        end
    end

    #Editamos un producto buscandolo por el ID
    #Tambien denegamos la accion a cualquier usuario que no comparta el ID asociado
    def edit
        authorize! product
    end

    #Actualizamos el producto
    def update
        authorize! product
        if product.update(product_params)
            redirect_to products_path, notice: t('.updated')
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    #Eliminacion de un producto con el ID
    def destroy
        authorize! product
        product.destroy
         
        redirect_to products_path, notice: t('.destroyed'), status: :see_other
    end


################################
    #Metodos que se protegen al estar en privado
    private

    def product_params
        params.require(:product).permit(:title, :description, :price, :photo, :category_id)
    end

    #Limpiamos parametros no especificados
    def product_params_index
        params.permit(:category_id, :min_price, :max_price, :query_text, :order_by, :page)
    end

    def product
        @product = Product.find(params[:id])
    end

end
