# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
  validates :title, presence: true
  validates :title, length: {minimum: 2, maximum: 30}
  validates :title, format: { with: /\A(?!@)/ }

  validates :content, presence: true
  validates :content, length: { minimum: 10 }
  validates :content, uniqueness: true

  has_many :tasks, dependent: :destroy

  belongs_to :user
end
