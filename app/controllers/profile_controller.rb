class ProfileController < ApplicationController
  before_filter :authenticate_user!

  def show
  end

  def edit_personal_info
    if current_user.person.nil?
      current_user.person = Author.new
    end
  end

  def update
    person_attr = params[:user][:person]
    person = Author.new(person_attr)
    result = person.valid?

    unless result
      return render :edit_personal_info
    end

    if current_user.person.nil?
      person.save
      current_user.update_attribute(:person, person) if result
    else
      current_user.person.update_attributes(person_attr)
    end

    redirect_to show_profile_path
  end
end
