class BatchesController < ApplicationController
  before_filter :authorize, :only => [:create, :edit, :new,  :update]
  before_filter :check_for_cancel, :only => [:create, :update]
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

  def create
    @batch = Batch.create(batch_params)
    if @batch.save
        flash[:notice] = "Batch successfully created"
        redirect_to @batch
    end
  end

  def check_for_cancel
    if params[:commit] == "Cancel"
      flash[:error] = "Update cancelled"
      if params[:id].nil?
        redirect_to "/"
      else
        @batch = Batch.find(params[:id]) 	
        redirect_to @batch
      end
    end
  end

  def update
    @batch = Batch.find(params[:id])
    @batch.update_attributes(batch_params)
    flash[:notice] = "Batch successfully saved"
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
