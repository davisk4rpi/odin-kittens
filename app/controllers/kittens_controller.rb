class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten Created"
      redirect_to kitten_path(@kitten)
    else
      flash.now[:danger] = "Everytime a field is filled out incorrectly, a " +
                           "kitten gets put out on the street"
      render :new
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.new(kitten_params)
    @kitten.save
  end

  def destroy
    Kitten.find(params[:id]).destroy
  end

  private

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
