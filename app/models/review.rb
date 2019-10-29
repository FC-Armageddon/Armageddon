class Review < ApplicationRecord

    belongs_to :user
    belongs_to :cd

    validates :body, presence: true

    default_scope -> { order(created_at: :desc) }
end
