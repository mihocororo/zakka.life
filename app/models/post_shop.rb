class PostShop < ApplicationRecord
  has_one_attached :image
  # has_many_attached :image
  belongs_to :area, optional: true

  belongs_to :customer, optional: true
  has_many :likes, dependent: :destroy
  def liked_by?(customer)
    likes.where(customer_id: customer).exists?
  end

  has_many :shop_comments
  accepts_nested_attributes_for :shop_comments
  validates :image, presence: true
  validates :image2, presence: true
  validates :introduction, presence: true
  validates :name, presence: true
  validates :area_id, presence: true
  # belongs_to :shop_comment, class_name: "Comment"

end
