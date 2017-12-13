class VersionsController < ApplicationController
  def show
    @version = PaperTrail::Version.find params[:id]
    authorize @version
  end
end
