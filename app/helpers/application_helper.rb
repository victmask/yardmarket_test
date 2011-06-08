module ApplicationHelper
  def logo
    logo = image_tag("logo.png", :alt => "Yard Market", :class => "round")
    link_to logo, root_path
  end
end
