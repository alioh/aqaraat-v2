module BillsHelper

	def all_residents_map
		res_list = [["None", "None"]]
		user_id = User.find(current_user)
		residents = current_user.residents
		residents.each { |b| 
			res_list << [b.name, b.id] }
	end

	def all_users_properties
		pro_list = [["None", "None"]]
		user_id = User.find(current_user)
		properties = current_user.properties
		properties.each { |b| 
			pro_list << [b.address, b.id] }
		return pro_list
	end

	def bill_to(a_resident_id)
		resident_name = nil
		residents = Resident.where("id = '?'", a_resident_id)
		residents.each { |b| 
			resident_name = b.name }
		return resident_name
	end

	def property_id_to_address(property_id)
		property_address = nil
		property = Property.where("id= '?'", property_id)  
		property.each { |b| 
			property_address = b.address } rescue nil
		return property_address
	end
end
