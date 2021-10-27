class Track < ApplicationRecord
  belongs_to :driver, :optional => true
end
