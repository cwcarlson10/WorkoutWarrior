class RoleValidator < ActiveModel::Validator
  def validate(record)
    if User.find_by_id(record.user_id).try(:role) != options[:role]
      record.errors[:base] << "User role is not properly assigned."
    end
  end
end
