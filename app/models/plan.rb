require 'csv'

class Plan < ActiveRecord::Base
  validates :plan_number, presence: true

  has_and_belongs_to_many :styles, join_table: 'plan_styles', foreign_key: 'plan_id', association_foreign_key: 'style_id'
  has_and_belongs_to_many :collections, join_table: 'plan_collections', foreign_key: 'plan_id', association_foreign_key: 'collection_id'
  has_and_belongs_to_many :features, join_table: 'plan_features', foreign_key: 'plan_id', association_foreign_key: 'feature_id'

  def self.bulk_apply style_val, plan_style_file, collection_val, plan_collection_file, feature_val, plan_feature_file
    error, proceed_for_next, err_msg = false, false, ''
    plan_styles, plan_collections, plan_features = Array.new, Array.new, Array.new

    if plan_style_file.present? && !style_val.nil?
      plan_styles, err_msg, proceed_for_next = process_csv plan_style_file, err_msg
    end

    if plan_collection_file.present? && !collection_val.nil?
      plan_collections, err_msg, proceed_for_next = process_csv plan_collection_file, err_msg
    end

    if plan_feature_file.present? && !feature_val.nil?
      plan_features, err_msg, proceed_for_next = process_csv plan_feature_file, err_msg
    end

    if proceed_for_next
      return error, err_msg
    else
      return error, err_msg
    end
  end

  def self.process_csv file, err_msg
    plans_arr, csv_ok, obj_arr = Array.new, false, Array.new

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
end
