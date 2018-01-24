class Comentario < ApplicationRecord
  belongs_to :post
  belongs_to :usuario
end
