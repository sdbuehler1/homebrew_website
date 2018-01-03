module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
  def get_navlink(nav_link, nav_controller, nav_action, nav_label)
    if nav_controller == params[:controller] && nav_action == params[:action]
      classactive = ' class="active"'
    else
      classactive = ''
    end
    link = "<a href=\"" + nav_link + "\"" + classactive + ">" + nav_label  + "</a>"
    link.html_safe
  end
end
