class CompulsoriesController < ApplicationController

    before_action :set_compulsory, only: [:show, :destroy]

    def index
        respond_with(@compulsories = Compulsory.all)
    end

    def show
        respond_with(@compulsory)
    end

    def new
        respond_with(@compulsory = Compulsory.new)
    end

    def create
        respond_with(@compulsory = Compulsory.create(compulsory_params))
    end

    def destroy
        respond_with(@compulsory.destroy)
    end

    private
    def compulsory_params
        params.require(:compulsory).permit(:code, :name)
    end

    def set_compulsory
        @compulsory = Compulsory.find(params[:id])
    end
end
