class TwitterConducer < Dao::Conducer
  def initialize( user )
    @user = user
  end

  def load!
    case action
    when 'show'
      # FIXME
    when 'sync'
      list = TwitterListConstructor.construct! "HackStars" , @user
      TwitterListSyncer.sync! list , user , User.syncable
      # TODO what method on the Twitter::Lists instance contains all the attributes?
      # update_attributes list.
    end
  end
end
