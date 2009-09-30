class TagsController < ResourceController::Base
  before_filter :login_required
end
