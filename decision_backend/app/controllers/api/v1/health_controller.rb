module Api 
  module V1 

class HealthController < ApplicationController
  def index
    db_status = database_connected?

    if db_status
      render json: { status: "ok", database: "connected" }, status: :ok
    else
      render json: { status: "degraded", database: "disconnected" }, status: :service_unavailable
    end
  end

  private

  def database_connected?
    ActiveRecord::Base.connection.active?
  rescue StandardError
    false
  end
end

end 
end