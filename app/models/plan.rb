require 'csv'

class Plan < ActiveRecord::Base
  validates :plan_number, presence: true

  has_and_belongs_to_many :styles, join_table: 'plan_styles', foreign_key: 'plan_id', association_foreign_key: 'style_id'
  has_and_belongs_to_many :collections, join_table: 'plan_collections', foreign_key: 'plan_id', association_foreign_key: 'collection_id'
  has_and_belongs_to_many :features, join_table: 'plan_features', foreign_key: 'plan_id', association_foreign_key: 'feature_id'

  def self.bulk_apply plan_attrs, plan_style_file, plan_collection_file, plan_feature_file, action=nil
    success = true
    plan_styles, plan_collections, plan_features = Array.new, Array.new, Array.new
    styles_check, collections_check, features_check = false, false, false

    if plan_style_file.present? || !plan_attrs[:style_ids].nil?
      if plan_style_file.present? && !plan_attrs[:style_ids].nil?
        plan_styles, styles_check            = process_csv plan_style_file
        success = false if !styles_check
      else
        success = false
      end
    end

    if plan_collection_file.present? || !plan_attrs[:collection_ids].nil?
      if plan_collection_file.present? && !plan_attrs[:collection_ids].nil?
        plan_collections, collections_check  = process_csv plan_collection_file
        success = false if !collections_check
      end
    end

    if plan_feature_file.present? || !plan_attrs[:feature_ids].nil?
      if plan_feature_file.present? && !plan_attrs[:feature_ids].nil?
        plan_features, features_check        = process_csv plan_feature_file
        success = false if !features_check
      end
    end

    if success
      apply_selected_attributes_to_plan(plan_styles.flatten, plan_attrs[:style_ids], action, 'styles') if styles_check
      apply_selected_attributes_to_plan(plan_collections.flatten, plan_attrs[:collection_ids], action, 'collections') if collections_check
      apply_selected_attributes_to_plan(plan_features.flatten, plan_attrs[:feature_ids], action, 'features') if features_check
      return success
    else
      return success
    end
  end

  def self.process_csv file
    plans_arr, csv_ok, obj_arr = Array.new, false, Array.new

    CSV.foreach( file.path, headers: true ) do | row |
      plans_arr.push row[0]
    end

    plans = where("plan_number IN (?)", plans_arr)

    if plans_arr.count == plans.count
      obj_arr.push(plans); obj_arr.flatten; csv_ok = true
    end

    return obj_arr, csv_ok
  end

  def self.apply_selected_attributes_to_plan plans_obj, input_elem, action, habtm_model
    plans_obj.each do | plan |
      input_elem.each do | elem |
        rec = habtm_model.find_by_id elem
        plan.send(habtm_model.to_sym) << rec
      end
    end
  end
end
