class Like < ApplicationRecord
  belongs_to :secret
  belongs_to :user
end
