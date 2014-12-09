module ApplicationHelper
  include FoundationRailsHelper::FlashHelper

  def controller_classes
    controller_path.gsub '/', ' '
  end

  def join_title(*args)
    args.join(" | ")
  end
end
