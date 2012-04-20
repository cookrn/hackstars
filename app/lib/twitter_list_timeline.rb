class TwitterListTimeline
  attr_reader :list , :options , :twitter_client , :timeline , :user

  def self.load( *args )
    loader = new *args
    loader.load
  end

  def initialize( *args )
    @options = Map.opts! args
    @list    = options.list rescue args.shift or raise ArgumentError.new( "No `list` provided!" )
    @user    = options.user rescue args.shift or raise ArgumentError.new( "No `user` provided!" )

    prepare_twitter!
  end

  def load
    @timeline ||= @twitter_client.list_timeline user.user_name , list[ "slug" ]
  end

  def prepare_twitter!
    @twitter_client ||= Twitter::Client.new \
      :oauth_token        => user.twitter_oauth_token,
      :oauth_token_secret => user.twitter_oauth_token_secret
  end
end
