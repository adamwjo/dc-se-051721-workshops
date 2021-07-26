class SuperFansController < ApplicationController

    def destroy
        super_fan = SuperFan.find_by(id: params[:id])
        if super_fan
            super_fan.destroy
            head :no_content
        else
            render json: {message: "Does not exist/could not find"}, status: :not_found
        end
    end
end
