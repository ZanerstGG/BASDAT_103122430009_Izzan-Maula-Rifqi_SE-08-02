use toko
switched to db toko
db.toko.insertMany([
  {
    "name": "Toko Berkah",
    "category": "Elektronik",
    "city": "Jakarta",
    "address": { "street": "Jl. Sudirman", "zipcode": "10220" },
    "products": [
      { "item": "TV", "price": 3500000, "stock": 10 },
      { "item": "Kulkas", "price": 2800000, "stock": 5 }
    ]
  },
  {
    "name": "Toko Maju",
    "category": "Elektronik",
    "city": "Bandung",
    "address": { "street": "Jl. Asia Afrika", "zipcode": "40111" },
    "products": [
      { "item": "HP", "price": 1500000, "stock": 20 },
      { "item": "Laptop", "price": 8000000, "stock": 3 }
    ]
  },
  {
    "name": "Toko Salim Bakery",
    "category": "Elektronik",
    "city": "Jakarta",
    "address": { "street": "Jl. Sudirman", "zipcode": "10220" },
    "products": [
      { "item": "Monitor LED", "price": 7700000, "stock": 11 },
      { "item": "Airfryer Panasonic", "price": 4850000, "stock": 7 }
    ]
  },
  {
    "name": "Toko Sudinotech",
    "category": "Elektronik",
    "city": "Surabaya",
    "address": { "street": "Jl. Sudirman", "zipcode": "10220" },
    "products": [
      { "item": "RTX 55000", "price": 8500000, "stock": 20 },
      { "item": "Set PC Gaming Radeon", "price": 12000000, "stock": 9 }
    ]
  }
])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('6a251ded9748dd0fc09521ad'),
    '1': ObjectId('6a251ded9748dd0fc09521ae'),
    '2': ObjectId('6a251ded9748dd0fc09521af'),
    '3': ObjectId('6a251ded9748dd0fc09521b0')
  }
}
db.toko.insertOne({
  "name": "Toko Sentosa",
  "category": "Pakaian",
  "city": "Semarang",
  "address": { "street": "Jl. Pemuda", "zipcode": "50132" },
  "products": [
    { "item": "Kemeja Pria", "price": 150000, "stock": 50 },
    { "item": "Celana Jeans", "price": 250000, "stock": 30 }
  ]
})
{
  acknowledged: true,
  insertedId: ObjectId('6a251e019748dd0fc09521b1')
}
db.toko.find({ "city": "Jakarta" })
{
  _id: ObjectId('6a251ded9748dd0fc09521ad'),
  name: 'Toko Berkah',
  category: 'Elektronik',
  city: 'Jakarta',
  address: {
    street: 'Jl. Sudirman',
    zipcode: '10220'
  },
  products: [
    {
      item: 'TV',
      price: 3500000,
      stock: 10
    },
    {
      item: 'Kulkas',
      price: 2800000,
      stock: 5
    }
  ]
}
{
  _id: ObjectId('6a251ded9748dd0fc09521af'),
  name: 'Toko Salim Bakery',
  category: 'Elektronik',
  city: 'Jakarta',
  address: {
    street: 'Jl. Sudirman',
    zipcode: '10220'
  },
  products: [
    {
      item: 'Monitor LED',
      price: 7700000,
      stock: 11
    },
    {
      item: 'Airfryer Panasonic',
      price: 4850000,
      stock: 7
    }
  ]
}
db.toko.find({ "products.price": { $gt: 3000000 } })
{
  _id: ObjectId('6a251ded9748dd0fc09521ad'),
  name: 'Toko Berkah',
  category: 'Elektronik',
  city: 'Jakarta',
  address: {
    street: 'Jl. Sudirman',
    zipcode: '10220'
  },
  products: [
    {
      item: 'TV',
      price: 3500000,
      stock: 10
    },
    {
      item: 'Kulkas',
      price: 2800000,
      stock: 5
    }
  ]
}
{
  _id: ObjectId('6a251ded9748dd0fc09521ae'),
  name: 'Toko Maju',
  category: 'Elektronik',
  city: 'Bandung',
  address: {
    street: 'Jl. Asia Afrika',
    zipcode: '40111'
  },
  products: [
    {
      item: 'HP',
      price: 1500000,
      stock: 20
    },
    {
      item: 'Laptop',
      price: 8000000,
      stock: 3
    }
  ]
}
{
  _id: ObjectId('6a251ded9748dd0fc09521af'),
  name: 'Toko Salim Bakery',
  category: 'Elektronik',
  city: 'Jakarta',
  address: {
    street: 'Jl. Sudirman',
    zipcode: '10220'
  },
  products: [
    {
      item: 'Monitor LED',
      price: 7700000,
      stock: 11
    },
    {
      item: 'Airfryer Panasonic',
      price: 4850000,
      stock: 7
    }
  ]
}
{
  _id: ObjectId('6a251ded9748dd0fc09521b0'),
  name: 'Toko Sudinotech',
  category: 'Elektronik',
  city: 'Surabaya',
  address: {
    street: 'Jl. Sudirman',
    zipcode: '10220'
  },
  products: [
    {
      item: 'RTX 55000',
      price: 8500000,
      stock: 20
    },
    {
      item: 'Set PC Gaming Radeon',
      price: 12000000,
      stock: 9
    }
  ]
}
db.toko.updateOne(
  { "name": "Toko Berkah" },
  { $set: { "category": "Aksesoris" } }
)
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
db.toko.aggregate([
  { $group: { _id: "$city", jumlahToko: { $sum: 1 } } },
  { $sort: { jumlahToko: -1 } }
])
{
  _id: 'Jakarta',
  jumlahToko: 2
}
{
  _id: 'Bandung',
  jumlahToko: 1
}
{
  _id: 'Surabaya',
  jumlahToko: 1
}
{
  _id: 'Semarang',
  jumlahToko: 1
}
db.toko.aggregate([
  { $unwind: "$products" },
  { $group: { _id: "$category", rataHarga: { $avg: "$products.price" } } }
])
{
  _id: 'Pakaian',
  rataHarga: 200000
}
{
  _id: 'Aksesoris',
  rataHarga: 3150000
}
{
  _id: 'Elektronik',
  rataHarga: 7091666.666666667
}
db.toko.updateOne(
  { "name": "Toko Maju" },
  { $push: { "products": { "item": "Mouse Wireless", "price": 150000, "stock": 15 } } }
)
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
db.toko.aggregate([
  { $unwind: "$products" },
  { $group: { _id: "$city", hargaTertinggi: { $max: "$products.price" } } }
])
{
  _id: 'Surabaya',
  hargaTertinggi: 12000000
}
{
  _id: 'Jakarta',
  hargaTertinggi: 7700000
}
{
  _id: 'Bandung',
  hargaTertinggi: 8000000
}
{
  _id: 'Semarang',
  hargaTertinggi: 250000
}
db.toko.aggregate([
  { $match: { "category": "Elektronik" } },
  { $unwind: "$products" },
  { $group: { _id: "$city", totalStock: { $sum: "$products.stock" } } },
  { $sort: { totalStock: -1 } }
])
{
  _id: 'Bandung',
  totalStock: 38
}
{
  _id: 'Surabaya',
  totalStock: 29
}
{
  _id: 'Jakarta',
  totalStock: 18
}
db.toko.deleteMany({
  $and: [
    { "category": "Fashion" },
    { "city": "Surabaya" }
  ]
})
{
  acknowledged: true,
  deletedCount: 0
}
toko


