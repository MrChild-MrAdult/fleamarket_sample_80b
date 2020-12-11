crumb :root do
  link "トップページ", root_path
end

crumb :category_index do
  link "カテゴリー一覧", categories_path
end

crumb :parent_category do |category|
  category = Category.find(params[:id]).root
  link "#{category.name}", parent_category_path(category)
  parent :category_index
end

crumb :child_category do |category|
  category = Category.find(params[:id])
  if category.has_children?
    link "#{category.name}", child_category_path(category)
    parent :parent_category
  else
    link "#{category.parent.name}", grandchild_category_path(category)
    parent :parent_category
  end
end

crumb :grandchild_category do |category|
  category = Category.find(params[:id])
  link "#{category.name}", grandchild_category_path(category)
  parent :child_category
end