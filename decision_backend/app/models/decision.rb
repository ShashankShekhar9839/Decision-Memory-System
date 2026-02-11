class Decision < ApplicationRecord
      enum status: {
    proposed: 0,
    accepted: 1,
    deprecated: 2,
    reversed: 3
  }

  validates :title, presence: true
  validates :status, presence: true
end
