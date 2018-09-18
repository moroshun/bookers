class Blog < ApplicationRecord
	belongs_to :user
    validates :body, presence: true
    validates :body,    length: { in: 1..200 }
end
