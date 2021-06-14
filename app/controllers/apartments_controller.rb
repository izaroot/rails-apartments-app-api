class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all 
        render json: apartments
    end

    def show
        apartment = Apartment.find(params[:id])
        render json: apartment
    rescue ActiveRecord::RecordNotFound
        render json: {"errors": "Apartment not found"}, status: 404
    end

    def create
        apartment = Apartment.create(apartment_params)
        render json: apartment, status: :created
    end

    def update
        apartment = Apartment.find(params[:id])
        apartment.update(apartment_params)
        render json: apartment
    rescue ActiveRecord::RecordNotFound
        render json: {"errors": "Apartment not found"}, status: 404
    end

    def destroy
        apartment = Apartment.find(params[:id])
        apartment.destroy
        render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
        render json: {"errors": "Apartment not found"}, status: 404
    end

    private

    def apartment_params
        params.permit(:number)    
    end

end
