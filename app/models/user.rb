class User < ApplicationRecord
  has_many :hobbies
  has_many :books
end
