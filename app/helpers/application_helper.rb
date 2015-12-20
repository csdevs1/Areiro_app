module ApplicationHelper
    def full_title(page_title =  '')
        base_title = "Areiro "
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end
    
    def description(description =  '')
        description
    end
    
    def image(image =  '')
        image
    end
end
