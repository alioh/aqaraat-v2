module ApplicationHelper
	def all_residents_map
		res_list = [["None", "None"]]
		user_id = User.find(current_user)
		residents = current_user.residents
		residents.each { |b| 
			res_list << [b.name, b.id] } rescue nil
	end

	def all_users_properties
		pro_list = [["None", "None"]]
		user_id = User.find(current_user)
		properties = current_user.properties
		properties.each { |b| 
			pro_list << [b.address, b.id] } rescue nil
		return pro_list
	end

	def bill_to(a_resident_id)
		resident_name = nil
		residents = Resident.where("id = '?'", a_resident_id)
		residents.each { |b| 
			resident_name = b.name } rescue nil
		return resident_name
	end

	def property_id_to_address(property_id)
		property_address = nil
		property = Property.where("id= '?'", property_id)  
		property.each { |b| 
			property_address = b.address } rescue nil
		return property_address
	end

	def this_user_property(resident_id)
		property_address = nil
		property = Property.where("resident_id = '?'", resident_id)
		property.each { |b| 
			property_address = b.address } rescue nil
		return property_address
	end
end
