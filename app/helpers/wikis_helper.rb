module WikisHelper
  def user_authorized?
    current_user.admin? || current_user.premium? || @wiki.private == false
  end
end
