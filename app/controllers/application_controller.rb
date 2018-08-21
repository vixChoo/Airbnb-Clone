class ApplicationController < ActionController::Base
  include Clearance::Controller

  add_flash_types :danger, :info , :warning , :success
end
