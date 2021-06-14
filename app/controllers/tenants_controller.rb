class TenantsController < ApplicationController

    def index
        tenants = Tenant.all 
        render json: tenants
    end

    def show
        tenant = Tenant.find(params[:id])
        render json: tenant
    rescue ActiveRecord::RecordNotFound
        render json: {"errors": "Tenant not found"}, status: 404
    end

    def create
        tenant = Tenant.new(tenant_params)

        if tenant.valid?
            tenant.save
            render json: tenant, status: :created
        else
            render json: {"errors" : tenant.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        tenant = Tenant.find(params[:id])
        tenant.update(tenant_params)
        render json: tenant
    rescue ActiveRecord::RecordNotFound
        render json: {"errors": "Tenant not found"}, status: 404
    end

    def destroy
        tenant = Tenant.find(params[:id])
        tenant.destroy
        render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
        render json: {"errors": "Tenant not found"}, status: 404
    end

    private

    def tenant_params
        params.permit(:name, :age)    
    end

end
