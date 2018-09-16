class ApplicationController < ActionController::Base
  include Clearance::Controller
  # before_action :set_default_metas

  add_flash_types :danger, :info , :warning , :success

  # def set_default_metas
  #   @content_title = "Airbnb Clone"
  #   @page_meta_tags = ""
  # end
end
