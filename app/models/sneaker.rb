class Sneaker < ApplicationRecord
    belongs_to :category, optional: true
    # belongs_to :user
    
    validates :name, presence: true
end
