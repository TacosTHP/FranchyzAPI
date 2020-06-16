module UsersHelper
  def decode_token
    token = request.headers['Authorization'].split[1]
    @decoded_token = JWT.decode token, nil, false
  end

  def check_auth
    if (request.headers['Authorization'] == nil)
      render json: 'token is missing'
    end
  end

  def check_admin
    if @decoded_token[0]['scp'] != 'coach'
        render json: 'you are not an admin'
    end

    coach = Coach.find(@decoded_token[0]['sub'])
    if (!coach.admin)
      render json: 'you are not an admin'
    end
  end
end
