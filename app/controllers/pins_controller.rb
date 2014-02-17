class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]


  def index
    @pins = Pin.all
  end

  def show
  end

  def new
    @pin = Pin.new
  end

  def edit
  end


  def create
    @pin = Pin.new(pin_params)
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.html { render action: 'new' }

      end
  end

  
  def update
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
  end


  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :string)
    end
end
