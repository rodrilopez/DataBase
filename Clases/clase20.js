db.customers.find({})

// 1.

db.getCollection('films').find({ Rating:'PG-13' },{ Title:  1, 'Special Features':1})

// 2.

db.getCollection('films').distinct("Length")

// 3.

db.getCollection('films').find({ Replacement_Cost: { $in: [ "20.00", "24.00" ]}})



