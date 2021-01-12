module ApplicationHelper
  def alert_style(type)
    case type
    when 'alert'  then 'danger'
    when 'notice' then 'info'
    else type || 'info'
    end
  end
end