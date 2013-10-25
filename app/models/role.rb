class Role < ActiveRecord::Base
   attr_accessible :name, :authority_ids

   has_many :assignments
   has_many :authorities, :through => :assignments

   has_many :users, :through => :user_roles
   has_many :user_roles

   after_save :caculate_authority

   private

   def caculate_authority
     authority_values = self.authorities.map(&:value).map(&:to_i).sum
     self.update_column(:authority, authority_values)
   end
   
end
