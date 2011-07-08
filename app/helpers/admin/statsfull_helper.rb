module Admin::StatsfullHelper

  def checker(id)
    TemplateGroup.find_by_id(id) != nil ?  (link_to "Show", admin_template_path(id)) : ("Deleted")
  end


end
