class ApplicationController < ActionController::API

    def secret_key
        "chicken"
    end

    #given some payload, I want to return a token
    def encode(payload)
        JWT.encode(payload, secret_key, 'HS256')
    end

    #given a token, I want to return the original payload 
    def decode(token)
        JWT.decode(token, secret_key, 'HS256')
    end
end
