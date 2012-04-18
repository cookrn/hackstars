module Api
  module V1
    class ListsController < AuthenticatedController
      VALID_REMOTE_ACTIONS = %w( show sync )

      before_filter :validate_action

      def remote
        @conducer = TwitterConducer.for @remote_action , current_user
        @conducer.load!
        render :json => @conducer.attributes
      end

    private

      def validate_action
        @remote_action = params[ :remote_action ].to_s
        return head( 404 ) unless VALID_REMOTE_ACTIONS.include?( @remote_action )
      end
    end
  end
end
