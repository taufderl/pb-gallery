module IssuesHelper
  def row_class(issue)
    if issue.solved?
      :success
    else
      ''
    end
  end
end
