module Api
  module V1
    class ListsController < AuthenticatedController
      def remote
        render :json => { :todo => 'BUILDME' }
      end
    end
  end
end
