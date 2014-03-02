class ErrorsController < ApplicationController
  def routing
    logger.error "Error de ruteo ( [#{request.method}] #{request.url} )"
    redirect_to root_url
  end
end
