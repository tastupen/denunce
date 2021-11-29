# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

major_category_names = ["愚痴のカテゴリー"]

complaints_categories = ["会社の愚痴", "家族の愚痴", "友達の愚痴", "嫁の愚痴", "旦那の愚痴", "人に言えない愚痴"]

major_category_names.each do |major_category_name|
  if major_category_name == "愚痴のカテゴリー"
        
    complaints_categories.each do |complaints_category|
      Category.create(
        name: complaints_category,
        description: complaints_category,
        major_category_name: major_category_name
      )
    end
  end
end