class TwitterList
  attr_reader :list , :list_name , :options , :twitter_client , :user

  def self.find( *args )
    list = new *args
    list.load
  end

  def self.load( *args )
    find *args
  end

  def initialize( *args )
    @options   = Map.opts! args
    @list_name = options.list_name rescue args.shift or raise ArgumentError.new( "No `list_name` provided!" )
    @user      = options.user      rescue args.shift or raise ArgumentError.new( "No `user` provided!" )

    prepare_twitter!
  end

  def load
    @list ||= @twitter_client.list normalize_list_name( list_name )
  end

  def normalize_list_name( name )
    name.to_s.downcase
  end

  def prepare_twitter!
    @twitter_client ||= Twitter::Client.new \
      :oauth_token        => user.twitter_oauth_token,
      :oauth_token_secret => user.twitter_oauth_token_secret
  end
end
