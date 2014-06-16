module PremonitionsHelper

  def format_date date
      unless date.blank?
         begin
            date.to_date.strftime("%A %d. %B %Y")
         rescue => ex
            logger.info "Invalid date - #{ex.class}: #{ex.message}"    
            return ""
         end
      end
   end

   def friendly_title(premonition)
      unless premonition.blank?
         title = premonition.title
         title.gsub("'","").gsub("/","-").gsub("&", "-").gsub("?","-").gsub(".","")
      end
   end
  
end
