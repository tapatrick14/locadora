require 'pry'

class MoviesController < ApplicationController
	#ANTES DE TUDO LOCALIZAR O MOVIE.
	before_action :set_movie, only: [:show, :edit, :update, :destroy]

	#SERA CRIADO UM INDEXADOR PRA OS FILMES.
	def index
		@movies = Movie.all
	end
    #SERA CRIADO UMA INSTANCIA DE MOVIE.
	def new
		@movie = Movie.new
	end
    #CRIA UM NOVO MOVIE.
	def create
		#MOVIE RECEBE OS PARAMETROS.
		@movie = Movie.new(movie_params)
    	respond_to do |format|
    		#SE O JOGO PUDER SER SALVO
    		if @movie.save
    			format.html {redirect_to @movie, notice: 'Movie was successfully created.'}
    			format.json { render :show, status: :created, location: @movie }
    		#SE NAO
    		else
    			format.html {render :new}
    			format.json{render json: @movie.errors, status: :unprocessable_entity}
    		end
    	end 
	end
	#DESTROI UM MOVIE.
	def destroy
		@movie.destroy
		respond_to do |format|
			format.html{redirect_to movies_url, notice: 'Movie was successfully destryed.'}
			format.json{head :no_content}
		end
	end
	#ADICIONA UMA MODIFICAÇAO A UM MOVIE
	def update
		respond_to do |format|
			#MOVIE RECEBE OS PARAMETROS
      		if @movie.update(movie_params)
        		format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        		format.json { render :show, status: :ok, location: @movie }
      		else
        		format.html { render :edit }
        		format.json { render json: @movie.errors, status: :unprocessable_entity }
      		end
    	end
	end
	#EDITAR UM MOVIE
	def edit
	end
	#MOSTRAR UM MOVIE
	def show
	end

	private
    #OS PARAMETROS SAO DEFINIDOS AQUI.
    def movie_params
    	params.require(:movie).permit(:title, :genre)
    end
    #LOCALIZAR UM ID ESPECIFICO.
    def set_movie
    	@movie = Movie.find(params[:id])
    end
end
