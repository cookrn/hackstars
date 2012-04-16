class UserConducer < Dao::Conducer
  AVAILABLE_USER_ROLES = [
    "Aspiring HackStar",
    "Enthusiast",
    "HackStars Alumnus",
    "TechStars Employee"
  ]

  USER_FIELDS_WHITELIST = %w( role )

  validates_presence_of :role , :in => AVAILABLE_USER_ROLES

  def available_user_roles
    AVAILABLE_USER_ROLES
  end

  def save
    update_user!

    if valid? and @user.save
      true
    else
      false
    end
  end

  def update_user!( *args )
    opts = Map.opts! args
    user = opts.user rescue args.shift || @user

    USER_FIELDS_WHITELIST.each do | field |
      field_val = attributes.get field
      user.send( "#{ field }=".to_sym , field_val ) if field_val.present? && !field_val.blank?
    end
  end
end
