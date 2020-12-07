class Result < ApplicationRecord
  include Loadable

  belongs_to :word
end
