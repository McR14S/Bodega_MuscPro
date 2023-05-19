class Product < ApplicationRecord

    include PgSearch::Model
    pg_search_scope :search_full_text, against: {
        title: 'A',
        description: 'B'
    }

    #datos de la imagenes
    has_one_attached :photo

    #datos del modelo
    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true

    #modelo product pertenece a una categoria
    belongs_to :category
end
