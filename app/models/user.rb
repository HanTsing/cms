class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :roles, :through => :user_roles
  has_many :user_roles

  #判断user自身的权限  和  所在的角色的权限
  def can?(authority_pinyin)
    authority = Authority.find_by_pinyin(authority_pinyin)
    authority_value = authority.value.to_i
    authority && (self.roles.map(&:authority).map(&:to_i).sum & authority_value) > 0
  end
  
end
