class User
  include Mongoid::Document

  field :image_url                  , :type => String
  field :last_sync                  , :type => DateTime
  field :role                       , :type => String
  field :twitter_oauth_token        , :type => String
  field :twitter_oauth_token_secret , :type => String
  field :user_name                  , :type => String

  def self.syncable
    where( :last_sync.ne => nil ).limit 500
  end

  def has_role?
    role.present? && !role.blank?
  end

  def has_synced?
    !!last_sync
  end

  def syncable?
    return false unless last_sync
    ( Time.now.utc - last_sync ) > 24.hours
  end

  def synced!
    self.last_sync = Time.now.utc
    save!
  end
end
