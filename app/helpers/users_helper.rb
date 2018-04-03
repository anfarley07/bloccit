module UsersHelper
  def post_exists?(user)
     user.posts.count > 0
  end

  def comment_exists?(user)
    user.comments.count > 0
  end
end
