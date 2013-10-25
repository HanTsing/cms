#encoding: utf-8
class PostCell < Cell::Rails

  cache :all_posts, :expires_in => 10.minutes
  cache :not_member_posts, :expires_in => 10.minutes

  def all_posts
   @posts = Post.published
    render
  end

  def not_member_posts
    @posts = Post.published.where(display_status: Post::DISPLAY_STATUS_ALL)
    render
  end
end
