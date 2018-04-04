class ApplicationController < ActionController::API

  require 'auth'

  protected
    def authenticate_request!
      if !payload || !Auth.valid_payload(payload.first)
        return invalid_authentication
      end

      load_current_user!
      invalid_authentication unless @current_user
    end

    def invalid_authentication
      render json: {error: 'Invalid Request'}, status: :unauthorized
    end

  private
    def payload
      auth_header = request.headers['Authorization']
      token = auth_header.split(' ').last
      Auth.decode(token)
    rescue
      nil
    end

    def load_current_user!
      @current_user = User.find_by(id: payload[0]['user_id'])
    end


    def json_response(object, status = :ok)
      render json: object, status: status
    end

end
