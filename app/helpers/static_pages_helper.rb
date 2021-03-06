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
      link_to 'Get Started', '#', 'data-target' => '#sign_up', 'data-toggle' => 'modal', class: 'btn btn-danger btn-lg'
    end
  end

  def navbar_app_title
    # if user_signed_in?
    #   if current_user.role == "trainer"
    #     @tag = " for Trainers"
    #   else
    #     @tag = " for Athletes"
    #   end
    # else
    #   @tag = ""
    # end
    link_to "WORKOUT WARRIOR", root_path, class: 'navbar-brand'
  end

end

