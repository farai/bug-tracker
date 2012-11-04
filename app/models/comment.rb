class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :bug
  
  attr_accessible :body
  
  validates :user_id, :presence => true
  validates :bug_id, :presence => true
  validates :body, :presence => true
  
  default_scope :order => 'comments.created_at asc'
end
