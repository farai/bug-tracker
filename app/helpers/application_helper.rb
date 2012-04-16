module ApplicationHelper
  def bootstrap_flashmgs(type)
    case type
       when :notice 
         then "alert alert-info"
       when :success 
         then "alert alert-success"
       when :error 
         then "alert alert-error"
       when :alert 
         then "alert alert-error"
    end
  end
end
