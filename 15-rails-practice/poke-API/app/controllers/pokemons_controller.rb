class PokemonsController < ApplicationController
    def index
        pokemons = Pokemon.all
        render json: pokemons
    end

    def show
        pokemon = Pokemon.find(params[:id])
        render json: pokemon
    end

    def create
        newPokemon = Pokemon.create(pokemon_params)
        if newPokemon.valid?
            render json: newPokemon, status: :created
        else
            render json: { errors: newPokemon.errors.full_messages }, status: :unprocessable_entity
        end
    end



    private

    def pokemon_params
        params.require(:pokemon).permit(:name, :poke_type, :weight, :image)
    end 

end
