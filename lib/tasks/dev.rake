namespace :dev do
  task fake: :environment do
    Category.destroy_all
    Restaurant.destroy_all

    category_list =[
      { name: "中式料理" },
      { name: "日本料理" },
      { name: "義大利料理" },
      { name: "墨西哥料理" },
      { name: "素食料理" },
      { name: "美式料理" },
      { name: "複合式料理" }
    ]

    category_list.each do |category|
      Category.create( name: category[:name] )
    end

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
      )
    end

    puts "Category created!"
    puts "Created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end
end