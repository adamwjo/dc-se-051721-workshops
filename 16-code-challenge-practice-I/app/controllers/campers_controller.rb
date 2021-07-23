class CampersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Camper.all 
    end

    def show
        render json: Camper.find(params[:id])
    end

    def create
        camper = Camper.create(camper_params)

        if camper.valid?
            render json: camper, status: :created
        else
            render json: camper.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: { error: "Could not find the camper you're looking for" }, status: :not_found
    end

end
