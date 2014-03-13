module Api
  module V1
    class TasksController < ApplicationController
      before_filter :restrict_access
      def index
        @tasks = Task.all
      end

      def show
        @task = Task.find(params[:id])
      end
    private

      #def restrict_access
      #  api_key = ApiKey.find_by_access_token(params[:access_token])
      #  head :unauthorized unless api_key
      #end

      #curl http://localhost:3000/api/v1/tasks.json -H 'Authorization: Token token=0bf392a70871df6cd354e85e0f52d874'
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          apikey = ApiKey.find_by_access_token(token)
          apikey.expires_at > Time.zone.now
        end
      end
    end
  end
end
