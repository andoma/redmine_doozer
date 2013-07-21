
class DoozerHookListener < Redmine::Hook::ViewListener
  def view_issues_changeset_bottom(context = {})

    id = context[:changeset].project.identifier
    rev = context[:changeset].revision

    begin
      dr = DecoratedRevision.find(rev, :params => {
                                    :project => id
                                  })
      return content_tag("strong", "Change included in version " + dr.version);
    rescue
      return ""
    end
  end
end
