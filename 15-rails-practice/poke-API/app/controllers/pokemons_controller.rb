class PokemonsController < ApplicationController
    def index
        pokemons = Pokemon.all
        render json: pokemons
    end

    def chicken
        render json: Pokemon.first
    end
end
