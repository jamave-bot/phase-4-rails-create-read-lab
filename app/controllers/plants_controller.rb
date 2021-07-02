class PlantsController < ApplicationController

    def index
        render json: Plant.all
    end


    def show
        plant = nil
        if Plant.find(params[:id])
            plant = Plant.find(params[:id])
        else
            plant = {error: "This plant doesn't exist"}
        end
        render json: plant
    end

    def create
        new_plant =  Plant.create(plant_info)
        render json: new_plant,  status: :created
    end


    private
    def plant_info
        params.permit(:name, :image, :price)
    end


end
