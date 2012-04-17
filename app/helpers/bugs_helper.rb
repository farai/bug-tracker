module BugsHelper
  def status_icon(type)
    case type
       when 'Open' 
         then "label label-important"   
       when 'Resolved'
         then "label label-success"
    end
  end
end
