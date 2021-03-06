class Bug < ActiveRecord::Base
  belongs_to :project
  has_many :comments, :dependent => :destroy
  
  validates_presence_of :author ,:email, :description, :status, :priority, :project_id
  validates :short_desc, :presence => true, :length => {:maximum => 200}
 
  

end
