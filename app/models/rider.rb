class Rider < ApplicationRecord
    has_many :trips
    validates :name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters." }
    validates :phone_num, format: {with: /[0-9]\-/,
    message: "only allows numbers and -." }
end
