class Admin::AdsController < Admin::ResourceController
  resource ::Ad, %w( name start_date end_date is_active body )
end
