class Category < ApplicationRecord
    #tiene varios productos y si hay productos no deja borrar
    has_many :products, dependent: :restrict_with_exception
end
