class Sub < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :moderator_id, presence: true

  belongs_to :moderator, class_name: :User

  has_many :post_subs

  has_many :posts,
    through: :post_subs,
    source: :post
end
