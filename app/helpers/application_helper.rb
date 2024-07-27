module ApplicationHelper
  def kaminari_pagination(scope)
    paginate scope, theme: 'twitter-bootstrap-4' if scope.respond_to?(:total_pages)
  end
end
