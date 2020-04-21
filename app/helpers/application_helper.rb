module ApplicationHelper

  def image_for(user)
    image_tag 'https://openstax.org/images/rover-by-openstax/rover-angled-corner.svg', alt: user.username, class: "rounded shadow mx-auto d-block"
  end
end
