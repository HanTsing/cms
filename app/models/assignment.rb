class Assignment < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :authority
  belongs_to :role
  
end
