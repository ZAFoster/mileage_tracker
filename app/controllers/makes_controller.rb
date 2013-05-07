class MakesController < ApplicationController

  def index
    @title = "My Makes"
    @makes = Make.all
  end

# def show
# end

  def new
    @make = Make.new
  end

  def create
    @make = Make.new(params[:make])

    respond_to do |format|
      if @make.save
        format.html { redirect_to(makes_url, :notice => 'Make successfully created.') }
#       format.html { redirect_to(@make, :notice => 'Make was successfully created.') }
        format.xml  { render :xml => @make, :status => :created, :location => @make }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @make.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @make = Make.find(params[:id])
  end

  def update
      @make = Make.find(params[:id])

    respond_to do |format|
      if @make.update_attributes(params[:make])
        format.html { redirect_to(makes_url, :notice => 'Make successfully updated.') }
#        format.html { redirect_to(@make, :notice => 'Make was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @make.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @make = Make.find(params[:id])
    @models = Model.where(:make_id => params[:id])
    if @models.empty?
      @make.destroy
      respond_to do |format|
        format.html { redirect_to(makes_url, :notice => 'Make successfully deleted') }
        format.xml  { head :ok }
      end
    else
      respond_to do |format|
          format.html { redirect_to(makes_url, :notice => 'Make not deleted, model(s) found') }
        format.xml  { head :ok }
      end
    end
  end

end
