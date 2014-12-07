module ApplicationHelper
  include FoundationRailsHelper::FlashHelper

  def join_title(*args)
    args.join(" | ")
  end
end
