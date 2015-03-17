class CompulsoriesController < ApplicationController

    def index
        respond_with(@compulsories = Compulsory.all)
    end
end
