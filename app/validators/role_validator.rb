class RoleValidator < ActiveModel::Validator
  def validate(record)
    unless User.find_by_id(record.user_id).try(:role) == options[:role]
      record.errors[:base] << "User role: #{options[:role]} is not properly assigned to user: #{record.user_id}."
    end
  end
end
