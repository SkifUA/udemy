module ApplicationHelper
  def login_helper(styles = '')
    if current_user.is_a?(GuestUser)
      (link_to "Registered", new_user_registration_path, class: styles) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: styles)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: styles
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on #{layout_name} layout"
      content_tag(:n, greeting, class: 'source-greetind')
    end
  end

  def copyright_generator
    DevcampViewTool::Renderer.copyright('Valerii Kuzin', 'All rights reserved')
  end

  def nav_items
    [
      {
          url: root_path,
          title: 'Home'
      },
      {
          url: about_me_path,
          title: 'About Me'
      },
      {
          url: contact_path,
          title: 'Contact'
      },
      {
          url: blogs_path,
          title: 'Blog'
      },
      {
          url: portfolios_path,
          title: 'Portfolio'
      }
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{check_active item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def check_active path
    'active' if current_page? path
  end
end
