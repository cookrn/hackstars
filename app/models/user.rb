class User
  include Mongoid::Document

  field :image_url
  field :role
  field :twitter_oauth_token
  field :twitter_oauth_token_secret
  field :user_name

  def has_role?
    role.present? && !role.blank?
  end
end
