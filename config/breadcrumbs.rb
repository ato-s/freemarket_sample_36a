crumb :root do
  link 'メルカリ', root_path
end

crumb :categories do
  link 'カテゴリー一覧', upper_categories_path
  parent :root
end

crumb :upper_categories do |upper_category|
  link upper_category.name, upper_category_path(upper_category)
  parent :categories, upper_category
end

crumb :middle_categories do |middle_category|
  link middle_category.name, middle_category_path(middle_category)
  parent :upper_categories, middle_category.upper_category
end

crumb :lower_categories do |lower_category|
  link lower_category.name, lower_category_path(lower_category)
  parent :middle_categories, lower_category.middle_category
end

crumb :brands do
  link 'ブランド一覧', brands_path
  parent :root
end

crumb :brand do |brand|
  link brand.name, brand_path(brand)
  parent :brands, brand
end
