module ApplicationHelper
	def flass_class(type)
		case type
		when :success then "success"
		when :error then "Warning"
		when :alert then"Warning"
		when :notice then ""

		else "info"
		end	
	end
			
end
