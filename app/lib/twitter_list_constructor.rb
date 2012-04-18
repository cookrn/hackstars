class TwitterListConstructor
  attr_reader :list , :list_name , :options , :twitter_client , :user

  def self.construct!( *args )
    constructor = new *args
    constructor.construct!
  end

  def initialize( *args )
    @options   = Map.opts! args
    @list_name = options.list_name rescue args.shift or raise ArgumentError.new( "No `list_name` provided!" )
    @user      = options.user      rescue args.shift or raise ArgumentError.new( "No `user` provided!" )

    prepare_twitter!
  end

  def create_list
    @twitter_client.list_create list_name
  end

  def fetch_list
    @twitter_client.list normalize_list_name( list_name )
  end

  def normalize_list_name( name )
    name.to_s.downcase
  end

  def prepare_twitter!
    @twitter_client ||= Twitter::Client.new \
      :oauth_token        => user.twitter_oauth_token,
      :oauth_token_secret => user.twitter_oauth_token_secret
  end

  def construct!
    @list ||= begin
                fetch_list
              rescue
                create_list
              end
  end
end
