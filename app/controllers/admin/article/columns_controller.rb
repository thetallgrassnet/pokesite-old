class Admin::Article::ColumnsController < Admin::ResourceController
  resource ::Article::Column, %w( name description )
end
