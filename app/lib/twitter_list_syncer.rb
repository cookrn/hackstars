class TwitterListSyncer
  attr_reader :list , :list_users , :options , :twitter_client , :user

  def self.sync!( *args )
    syncer = new *args
    syncer.sync!
  end

  def initialize( *args )
    @options    = Map.opts! args
    @list       = options.list       rescue args.shift or raise ArgumentError.new( "No `list` provided!" )
    @user       = options.user       rescue args.shift or raise ArgumentError.new( "No `user` provided!" )
    @list_users = options.list_users rescue args.shift or raise ArgumentError.new( "No `list_users` provided!" )

    prepare_twitter!
  end

  def prepare_twitter!
    @twitter_client ||= Twitter::Client.new \
      :oauth_token        => user.twitter_oauth_token,
      :oauth_token_secret => user.twitter_oauth_token_secret
  end

  def sync!
    # FIXME
  end
end
