module ApplicationHelper

  def image_for(user)
    image_tag 'https://openstax.org/images/rover-by-openstax/rover-angled-corner.svg', alt: user.username, class: "rounded shadow mx-auto d-block"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]    
  end

  def logged_in?
    !!current_user
  end
end
