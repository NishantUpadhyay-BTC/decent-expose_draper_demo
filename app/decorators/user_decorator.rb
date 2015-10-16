class UserDecorator < Draper::Decorator
  delegate_all
  
  def created_at
      object.created_at.strftime("%B %e, %Y") if object.created_at.present?
  end

  def linked_name
    object.full_name.present? ? "Linked: #{model.full_name}" : "Linked: #{object.username}"
  end
end
