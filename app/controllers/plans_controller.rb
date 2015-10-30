class PlansController < ApplicationController

  def create
    @plan = Plan.bulk_apply params[:styles], params[:plan_styles_file], params[:collectios], params[:plan_collections_file], params[:features], params[:plan_features_file]

    respond_to do | format |
      if @plan.first
        flash[:notice] = @plan.last
        format.html { redirect_to(plans_path) }
      else
        flash[:error] = @plan.last
        format.html { render action: :index }
      end
    end
  end

end
