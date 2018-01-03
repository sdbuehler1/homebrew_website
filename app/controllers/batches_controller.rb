class BatchesController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @batches = Batch.order(sort_column + ' ' + sort_direction)
  end

  def show
    @batch = Batch.find(params[:id])
  end

  def edit
    @batch = Batch.find(params[:id])
  end

  def new
    @batch = Batch.new
  end

  def update
    @batch = Batch.find(params[:id])
    @batch.update_attributes(batch_params)
    redirect_to @batch
  end

  def ontap
    @batches = Batch.where("ontap <> 'no'")
  end

  def awards
    @batches = Batch.where("awards <> ''")
  end

  private
  def sort_column
    Batch.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def batch_params
    params.require(:batch).permit(:name, :brew_date, :bottle_date, :og, :fg, :ibu, :srm, :volume, :bottles, :bottle_conditioned, :notes, :description, :awards, :ontap)
  end

end
