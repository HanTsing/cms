class Post < ActiveRecord::Base
  attr_accessible :title, :content, :display_status, :status, :user_id

  validates :title, presence: true

  STATUS_PUBLISHED = 1
  STATUS_HIDDEN    = 0

  DISPLAY_STATUS_MEMBER   = 1
  DISPLAY_STATUS_ALL      = 0

  paginates_per 20

  scope :published, where(status: STATUS_PUBLISHED)

end
