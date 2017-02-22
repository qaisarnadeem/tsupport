class Ticket < ApplicationRecord
  enum status: [:open,:in_progress,:resolved]
  belongs_to :user
  belongs_to :resolved_by , class_name: 'User',optional: true
  has_many :comments
  validates_presence_of :title , :description
  rails_admin do
    edit do
      field :title
      field :description
      field :status
    end
  end
end
