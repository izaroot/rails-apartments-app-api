class LeasesController < ApplicationController

    def create
        lease = Lease.create(lease_params)
        render json: lease, status: :created      
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
        render json: {"errors": "Lease not found"}, status: 404
    end

    private

    def lease_params
        params.permit(:apartment_id, :tenant_id, :rent)
    end

end
