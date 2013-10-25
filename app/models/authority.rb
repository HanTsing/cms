class Authority < ActiveRecord::Base
   attr_accessible :name, :value, :pinyin

   has_many :assignments
   has_many :authorities, :through => :assignments
   
end
