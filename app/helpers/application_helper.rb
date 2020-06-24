module ApplicationHelper

  def image_for(user)
    num = Random.rand(1...12)
    image_tag 'image' + num.inspect, alt: user.username, class: "rounded shadow mx-auto d-block"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]    
  end

  def logged_in?
    !!current_user
  end
end
