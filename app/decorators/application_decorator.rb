class ApplicationDecorator < Draper::Base
    def created_at
        puts "=="
        model.created_at.strftime("%B %e, %Y")
    end
end