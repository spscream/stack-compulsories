class CompulsoriesController < ApplicationController

    def index
        respond_with(@compulsories = Compulsory.all)
    end

    def show
        respond_with(@compulsory = Compulsory.find(params[:id]))
    end

    def new
        respond_with(@compulsory = Compulsory.new)
    end

    def create
        respond_with(@compulsory = Compulsory.create(compulsory_params))
    end

    private
    def compulsory_params
        params.require(:compulsory).permit(:code, :name)
    end
end
