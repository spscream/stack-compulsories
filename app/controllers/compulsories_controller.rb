class CompulsoriesController < ApplicationController

    before_action :set_compulsory, except: [:index, :new, :create]

    def index
        @compulsories = Compulsory.all
        @compulsory_disciplines = @compulsories.group_by { |t| t.discipline_i18n }
        respond_with @compulsories
    end

    def show
        respond_with(@compulsory)
    end

    def new
        respond_with(@compulsory = Compulsory.new)
    end

    def create
        respond_with(@compulsory = Compulsory.create(compulsory_params), location: -> { compulsories_path })
    end

    def edit
        respond_with(@compulsory, location: -> { compulsories_path })
    end

    def update
        @compulsory.update(compulsory_params)
        respond_with(@compulsory, location: -> { compulsories_path } )
    end

    def destroy
        respond_with(@compulsory.destroy)
    end

    private
    def compulsory_params
        params.require(:compulsory).permit(:code, :name, :image, :discipline, :description)
    end

    def set_compulsory
        @compulsory = Compulsory.find(params[:id])
    end
end
