class Word < ApplicationRecord
  has_one :result, dependent: :destroy
end
