module BugsHelper
  def developer_name(bug)
    developer = User.find_by(id: bug.developer_id)
    developer.present? ? developer.name : 'Not Assigned'
  end

  def limited_status_options(bug)
    if bug.feature?
      ['started', 'completed']
    elsif bug.bug?
      ['started', 'resolved']
    else
      Bug.statuses.keys
    end
  end

  def selected_status_option(bug)
    bug.status.present? ? bug.status : 'initial'
  end
end
