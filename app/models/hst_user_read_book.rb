class HstUserReadBook < ApplicationRecord
  belongs_to :user
  belongs_to :user_book
end
