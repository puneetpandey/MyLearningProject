module PlansHelper
  def populate_style_options
    html = "<table><tr>"
    Style.select("id, name").each { |style|
      html += "<td>"
      html += check_box_tag 'plan[style_ids][]', style.id
      html += style.name
      html += "</td>"
    }
    html += "</tr></table>"
    html.html_safe
  end

  def populate_collection_options
    html = "<table><tr>"
    Collection.select("id, name").each { | collection |
      html += "<td>"
      html += check_box_tag 'plan[collection_ids][]', collection.id
      html += collection.name
      html += "</td>"
    }
    html += "</tr></table>"
    html.html_safe
  end

  def populate_feature_options
    html = "<table><tr>"
    Feature.select('id, name').each { | feature |
      html += "<td>"
      html += check_box_tag 'plan[feature_ids][]', feature.id
      html += feature.name
      html += "</td>"
    }
    html += "</tr></table>"
    html.html_safe
  end
end
