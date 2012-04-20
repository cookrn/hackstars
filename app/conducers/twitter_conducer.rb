class TwitterConducer < Dao::Conducer
  TWITTER_STATUS_PRESENTABLE_FIELDS = %w(
    created_at
    text
    user.name
    user.profile_image_url_https
    user.screen_name
    user.url
  )

  def initialize( user )
    @user = user
  end

  def load!
    case action
    when 'show'
      # FIXME
    when 'sync'
      sync! if @user.syncable?
    end

    list = prepare_list TwitterList.load( "HackStars" , @user )
    timeline = prepare_list_timeline TwitterListTimeline.load( list , @user )
    raise timeline.inspect
    update_attributes :list => list.attrs
  end

  def prepare_list( list )
    list
  end

  def prepare_list_timeline( list_timeline )
    list_timeline
    # new_timeline = []
    # list_timeline.each do | status |
    #   attrs = Map.new status.attrs
    #
    # end
  end

  def sync!
    list = TwitterListConstructor.construct! "HackStars" , @user
    TwitterListSyncer.sync! list , @user , User.syncable
    @user.synced!
  end
end
