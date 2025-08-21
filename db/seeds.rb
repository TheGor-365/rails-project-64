# frozen_string_literal: true

%w[general ruby rails javascript].each do |name|
  Category.find_or_create_by!(name: name)
end
