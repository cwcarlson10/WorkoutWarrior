module StaticPagesHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end


  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
    devise_mapping.to
  end

  def get_started
    if !current_user
      link_to 'Get Started', new_user_registration_path, class: "btn btn-danger"
    end
  end

end
