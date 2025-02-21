module ApplicationHelper
    def appointment_status_badge(status)
      case status
      when 'scheduled'
        'info'
      when 'completed'
        'success'
      when 'cancelled'
        'warning'
      else
        'secondary'
      end
    end
  end