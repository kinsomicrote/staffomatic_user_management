# frozen_string_literal: true

class ArchivesController < ApplicationController
  before_action :set_paper_trail_whodunnit, only: :update

  def update
    if current_user.id == params[:id].to_i
      render json: { message: "You can't archive your account" } , status: :unprocessable_entity
    else
      user = User.find(params[:id])
      user.update!(archived: !user.archived)
      ArchiveService.new.call(user.email, user.archived)

      render jsonapi: user
    end
  end
end