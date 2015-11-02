require 'csv'

class Plan < ActiveRecord::Base
  validates :plan_number, presence: true

  has_and_belongs_to_many :styles, join_table: 'plan_styles', foreign_key: 'plan_id', association_foreign_key: 'style_id'
  has_and_belongs_to_many :collections, join_table: 'plan_collections', foreign_key: 'plan_id', association_foreign_key: 'collection_id'
  has_and_belongs_to_many :features, join_table: 'plan_features', foreign_key: 'plan_id', association_foreign_key: 'feature_id'

  def self.bulk_apply plan_attrs, plan_style_file, plan_collection_file, plan_feature_file, action=nil
    error, err_msg = false, ''
    plan_styles, plan_collections, plan_features = Array.new, Array.new, Array.new
    styles_check, collections_check, features_check = false, false, false

    plan_styles, err_msg, styles_check            = process_csv plan_style_file if plan_style_file.present? && !plan_attrs[:style_ids].nil?
    plan_collections, err_msg, collections_check  = process_csv plan_collection_file if plan_collection_file.present? && !plan_attrs[:collection_ids].nil?
    plan_features, err_msg, features_check        = process_csv plan_feature_file if plan_feature_file.present? && !plan_attrs[:feature_ids].nil?

    Rails.logger.info "inspecting proceed_for_next*********************#{styles_check.inspect}"
    Rails.logger.info "inspecting proceed_for_next*********************#{collections_check.inspect}"
    Rails.logger.info "inspecting proceed_for_next*********************#{features_check.inspect}"
    Rails.logger.info "err_msg*********************#{err_msg.inspect}"
    Rails.logger.info "plan_styles*********************#{plan_styles.inspect}"
    Rails.logger.info "plan_collections*********************#{plan_collections.inspect}"
    Rails.logger.info "plan_features*********************#{plan_features.inspect}"

    if true
      apply_selected_attributes_to_plan(plan_styles.flatten, plan_attrs, action)
      success_msg = err_msg = 'Selected attributes applied to plan/s successfully'
      return error, success_msg
    else
      return error, err_msg
    end
  end

  def self.process_csv file
    plans_arr, csv_ok, obj_arr, err_msg = Array.new, false, Array.new, ''

    CSV.foreach( file.path, headers: true ) do | row |
      plans_arr.push row[0]
    end

    plans = where("plan_number IN (?)", plans_arr)

    if plans_arr.count == plans.count
      obj_arr.push(plans); obj_arr.flatten; csv_ok = true
    else
      err_msg += 'Some of the Plan Numbers does not exists in Database for ' + file.original_filename.to_s + '. '
    end

    return obj_arr, err_msg, csv_ok
  end

  def self.apply_selected_attributes_to_plan plans_obj, input_elem, action
    plans_obj.each do | plan |
      input_elem.each do | elem |
        style = Style.find_by_id elem
        plan.styles << style
      end
    end
  end
end
