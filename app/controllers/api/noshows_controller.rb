class Api::NoshowsController < BaseApiController


  def create
    @noshow = Noshow.new(noshow_params)
    if @noshow.save
      render json: @noshow
    end
  end

  def update
    @noshow = Noshow.find params[:id]
    render json: @noshow
  end

  def noshow_params
    params.require(:noshow).permit(:participant, :task, :spotted)
  end
end
