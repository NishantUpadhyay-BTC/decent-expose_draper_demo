class UserDecorator < Draper::Decorator
  delegate_all
  
  def created_at
    
    if object.created_at
        object.created_at.strftime("%B %e, %Y")
    end
  end
end
