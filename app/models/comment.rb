# == Schema Information
#
# Table name: comments
#
#  id              :bigint           not null, primary key
#  comment_content :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  task_id         :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_comments_on_task_id  (task_id)
#  index_comments_on_user_id  (user_id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :comment_content, null: false
end
