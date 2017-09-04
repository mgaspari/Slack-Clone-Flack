class User < ApplicationRecord
  has_many :messages
  has_many :receiver, through: :messages
end
