class UsersController < ApplicationController
  def index
    if params.has_key?(:archived)
      render jsonapi: User.where(archived: params[:archived])
    else
      render jsonapi: User.all
    end
  end
end
