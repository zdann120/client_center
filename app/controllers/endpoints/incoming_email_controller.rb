class Endpoints::IncomingEmailController < ApplicationController
  protect_from_forgery :except => [:execute]
  def execute
    parsed = Postmark::Json.decode(request.body.read)
    puts parsed
    parser = identify_parser(parsed)
    @outcome = parser.run(email_hash: parsed)
    if @outcome.valid?
      render json: @outcome.result, status: 200
    else
      render json: {msg: 'oops'}, status: 500
    end
  end

  def identify_parser(parsed)
    if parsed['ToFull'][0]['Email'].split('+')[0] == 'account'
      ProcessAccountEmail
    else
      false
    end
  end
end
