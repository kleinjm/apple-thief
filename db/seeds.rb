require 'faker'

# REAL SEED

# Bag.create([
#   { :name => "Duffle Bag", :description => "The duffle bag is the biggest bag that you can use!", :capacity => 150, :photo_url => "http://images.mec.ca/fluid/customers/c822/5030-442/generated/5030-442_BK474_view1_1000x1000.jpg", :created_at => "2015-08-04 19:09:37", :updated_at => "2015-08-04 19:09:37" },
#   { :name => "Backpack", :description => "The backpack is the one-size-fits-all of stealing.", :capacity => 60, :photo_url => "http://g-ecx.images-amazon.com/images/G/01/aplus/detail-page/B0019M9EPK_swissgear_img_1.jpg", :created_at => "2015-08-04 19:23:59", :updated_at => "2015-08-04 19:23:59" },
#   { :name => "Purse", :description => "Best choice for the casual day out stealing things.", :capacity => 15, :photo_url => "http://enchantedgiving.com/wp-content/uploads/2013/02/purse03.jpg", :created_at => "2015-08-04 19:26:54", :updated_at => "2015-08-04 19:26:54" },
#   { :name => "Paper bag", :description => "Great for stealing things between stores.", :capacity => 40, :photo_url => "http://www.psdgraphics.com/file/paper-shopping-bag.jpg", :created_at => "2015-08-04 19:30:23", :updated_at => "2015-08-04 19:30:23" },
#   { :name => "Shoulder Bag", :description => "Stylish way to take things and look like a bike messanger.", :capacity => 55, :photo_url => "http://pngimg.com/upload/women_bag_PNG6403.png", :created_at => "2015-08-04 19:33:15", :updated_at => "2015-08-04 19:33:15" },
#   { :name => "Pocket", :description => "Great option if you had little prep time and don't care about stealing much.", :capacity => 1, :photo_url => "http://phandroid.s3.amazonaws.com/wp-content/uploads/2011/09/messy-pocket.png", :created_at => "2015-08-14 18:16:16", :updated_at => "2015-08-14 18:16:16" }
# ], :without_protection => true )



# Item.create([
#   { :name => "Apple II", :description => "The latest and greatest in the world of Macs", :weight => 100, :value => 10, :photo_url => "https://upload.wikimedia.org/wikipedia/commons/4/49/Science_museum_025_adjusted.jpg", :created_at => "2015-08-12 19:50:06", :updated_at => "2015-08-14 18:33:04", :priority => nil, :quantity => nil },
#   { :name => "Mac Desktop", :description => "Big but valuable!", :weight => 40, :value => 2500, :photo_url => "http://www7.pcmag.com/media/images/202211-apple-mac-mini-nvidia-geforce-9400m-mini-with-display.jpg?width=630", :created_at => "2015-08-14 19:34:22", :updated_at => "2015-08-16 20:49:58", :priority => nil, :quantity => nil },
#   { :name => "Macbook Pro", :description => "The best laptop ever", :weight => 7, :value => 2200, :photo_url => "http://cdn.cultofmac.com/wp-content/uploads/2014/03/old-MacBook-Pro-13.jpg", :created_at => "2015-08-12 19:51:49", :updated_at => "2015-08-16 20:49:58", :priority => nil, :quantity => nil },
#   { :name => "iPad", :description => "Good for output, bad for input. Should have a great resell value!", :weight => 5, :value => 500, :photo_url => "http://www.imore.com/sites/imore.com/files/styles/large/public/topic_images/2014/topic_ipad_air_ipad_mini_0.png?itok=053pCsJ2", :created_at => "2015-08-12 19:56:16", :updated_at => "2015-08-14 19:55:20", :priority => nil, :quantity => nil },
#   { :name => "iPhone 6", :description => "iPhone 6 isn’t simply bigger — it’s better in every way. Larger, yet dramatically thinner. More powerful, but remarkably power efficient. With a smooth metal surface that seamlessly meets the new Retina HD display. ", :weight => 2, :value => 600, :photo_url => "http://orzly.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-6-flexislim-smoke-white_3.jpg", :created_at => "2015-08-05 16:00:15", :updated_at => "2015-08-14 18:33:36", :priority => nil, :quantity => nil },
#   { :name => "iPod Headphones", :description => "Pretty standard headphones.", :weight => 1, :value => 8, :photo_url => "http://admin.all4cellular.com/media/catalog/product/a/p/apple-earpods-with-remote-and-mic-white-complete-view_2.jpg", :created_at => "2015-08-05 16:13:32", :updated_at => "2015-08-16 20:21:26", :priority => nil, :quantity => nil }
# ], :without_protection => true )


# TESTING
1000.times do 
  Item.create(name: Faker::Name.first_name, weight: [*1..100].sample, value: [*1..100].sample)
end

Bag.create(name: Faker::Name.first_name, capacity: 5)
Bag.create(name: Faker::Name.first_name, capacity: 10)
Bag.create(name: Faker::Name.first_name, capacity: 50)
Bag.create(name: Faker::Name.first_name, capacity: 100)
Bag.create(name: Faker::Name.first_name, capacity: 500)
Bag.create(name: Faker::Name.first_name, capacity: 1000)
Bag.create(name: Faker::Name.first_name, capacity: 5000)
Bag.create(name: Faker::Name.first_name, capacity: 10000)