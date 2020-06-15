class Category < ApplicationRecord
    has_many :sneakers, dependent: :destroy
end
