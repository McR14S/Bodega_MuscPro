class Category < ApplicationRecord

    validates :name, presence: true

    #tiene varios productos y si hay productos no deja borrar
    has_many :products, dependent: :destroy

end
