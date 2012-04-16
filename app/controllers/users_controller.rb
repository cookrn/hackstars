class UsersController < AuthenticatedController
  before_filter :ensure_same_user

  def edit
    @conducer = initialize_conducer_for :edit
  end

  def update
    @conducer = initialize_conducer_for :update
    if @conducer.save
      redirect_to list_path
    else
      redirect_to edit_user_path( current_user.id.to_s ) , :flash => { :error => "Unable to save your role -- please try again!" }
    end
  end

private

  def ensure_same_user
    redirect_to auth_logout_path unless params[ :id ] == current_user.id.to_s
  end

  def initialize_conducer_for( action )
    UserConducer.call( action , current_user , params[ :user ] )
  end
end
