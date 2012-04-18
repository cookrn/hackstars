class User
  include Mongoid::Document

  field :image_url                  , :type => String
  field :last_sync                  , :type => Date
  field :role                       , :type => String
  field :twitter_oauth_token        , :type => String
  field :twitter_oauth_token_secret , :type => String
  field :user_name                  , :type => String

  def has_role?
    role.present? && !role.blank?
  end

  def has_synced?
    !!last_sync
  end
end
