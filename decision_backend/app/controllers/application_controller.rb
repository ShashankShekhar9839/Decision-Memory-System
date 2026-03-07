class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ArgumentError, with: :invalid_enum
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

   def require_admin 
   unless current_user&.admin? 
    render json: {error: "Admin access required"}, status: :forbidded
   end
   end

  private

  def record_not_found
    render json: { error: "Record not found" }, status: :not_found
  end

  def invalid_enum(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  def parameter_missing(exception)
    render json: { error: exception.message }, status: :bad_request
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end

    def decoded_token
    header = request.headers['Authorization']
    token = header.split(' ')[1] if header

    return nil unless token

    begin
      JWT.decode(token, Rails.application.secret_key_base)[0]
    rescue JWT::DecodeError
      nil
    end
  end

    def current_user
    decoded = decoded_token
    return nil unless decoded

    @current_user ||= User.find_by(id: decoded["user_id"])
  end

    def authenticate_user!
    render json: { error: "Not Authorized" }, status: :unauthorized unless current_user
  end

end
