class ProductsController < ApplicationController
    def index
        @categories = Category.order(name: :asc).load_async
        @products = Product.all.with_attached_photo.order(created_at: :desc).load_async

        #Preguntamos para filtrar por categoria
        if params[:category_id]
            @products = @products.where(category_id: params[:category_id])
        end

        #Filtros por precio
        if params[:min_price].present?
            @products = @products.where("price >= ?", params[:min_price])
        end
        if params[:max_price].present?
            @products = @products.where("price <= ?", params[:max_price])
        end
        #Filtramos por query
        if params[:query_text].present?
            @products = @products.search_full_text(params[:query_text])
        end

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
    def edit
        product
    end

    #Actualizamos el producto
    def update
        if product.update(product_params)
            redirect_to products_path, notice: t('.updated')
        else
            render :edit, status: :unprocessable_entity
        end
    end

    #Eliminacion de un producto con el ID
    def destroy
        product.destroy
         
        redirect_to products_path, notice: t('.destroyed'), status: :see_other
    end


################################
    #Metodos que se protegen al estar en privado
    private

    def product_params
        params.require(:product).permit(:title, :description, :price, :photo, :category_id)
    end

    def product
        @product = Product.find(params[:id])
    end

end
