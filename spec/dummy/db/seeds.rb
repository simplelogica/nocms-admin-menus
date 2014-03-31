Page.destroy_all

10.times.each do |i|
  Page.create(
    name: " Page #{Faker::Lorem.sentence} #{i}"
  )
end

Product.destroy_all

10.times.each do |i|
  Product.create(
    name: " Product #{Faker::Lorem.sentence} #{i}"
  )
end
