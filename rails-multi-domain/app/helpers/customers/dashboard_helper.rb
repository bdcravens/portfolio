module Customers::DashboardHelper
  def active_indicator(is_active)
    label = is_active ? 'Active' : 'Inactive'
    if @site == 'customers'
      color = is_active ? 'green' : 'red'
      fonticon = is_active ? 'md md-done' : 'md md-warning'
      "<div style='color:#{color};'><i class='#{fonticon}'></i> #{label}</div>".html_safe
    end
  end
end
