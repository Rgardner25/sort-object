require 'rspec'

def position_enforcer(pre_existing_array, new_obj_to_add)
  return set_default_of_position_one_for_first_element(pre_existing_array, new_obj_to_add) if pre_existing_array.empty?
  return add_obj_to_end_of_collection(pre_existing_array, new_obj_to_add) unless new_obj_to_add[:position]
  add_obj_and_resort(pre_existing_array, new_obj_to_add)
end

def set_default_of_position_one_for_first_element(arr, obj)
  obj[:position] = 1
  arr << obj
end

def add_obj_to_end_of_collection(arr, obj)
  stack_position = arr.last[:position] + 1
  obj[:position] = stack_position
  arr << obj
end

def add_obj_and_resort(arr, obj)
  objects_with_positions_higher = arr.select { |e| e[:position] >= obj[:position] }
  objects_with_positions_higher.map { |e| e[:position] += 1 }
  objects_with_positions_higher.sort_by { |e| e[:position] }
  arr << obj
  arr.sort_by { |e| e[:position] }
end
