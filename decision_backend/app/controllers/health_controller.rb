class HealthController < ApplicationController
  def index
    render json: { status: "ok, health is good" }, status: :ok
  end
end