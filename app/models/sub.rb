class Sub < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :moderator_id, presence: true, uniqueness: true

  has_one :moderator, class_name: :User
end
