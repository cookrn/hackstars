class ListsController < AuthenticatedController
  before_filter :check_user_role

  def show
  end

private

  def check_user_role
    redirect_to edit_user_path( current_user.id.to_s ) unless current_user.has_role?
  end
end
