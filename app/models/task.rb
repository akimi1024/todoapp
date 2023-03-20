# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  limit        :integer
#  status       :integer          default(0)
#  task_content :text             not null
#  task_title   :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  board_id     :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
class Task < ApplicationRecord
  has_one_attached :eyecatch

  belongs_to :user
  belongs_to :board

  validates :title, null: false
  validates :content, null: false
end
