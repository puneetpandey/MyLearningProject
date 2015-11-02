class PlansController < ApplicationController

  def create
    @plan = Plan.bulk_apply params[:plan], params[:plan_styles_file], params[:plan_collections_file], params[:plan_features_file]

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

private
  def plan_params
    params.require(:plan).permit({style_ids: []}, {collection_ids: []}, {feature_ids: []})
  end
end
