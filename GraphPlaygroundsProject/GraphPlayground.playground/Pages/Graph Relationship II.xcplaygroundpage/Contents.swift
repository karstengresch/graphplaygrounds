//: [Previous](@previous)
// Source: https://github.com/CosmicMind/Graph/issues/132
import Foundation
import Graph

let graph = Graph()
graph.reset()
graph.clear()

let users1 = Entity(type: "User")
users1["name"]="John"
users1["date"]="08/05/2017"
users1["image"]="img1"

let users2 = Entity(type: "User")
users2["name"]="Jack"
users2["date"]="08/05/2017"
users2["image"]="img2"

let trip1 = Entity(type: "Trip")
trip1["location"]="USA"
trip1["vehicle"]="CAR"

users1.is(relationship: "Subscriber").of(trip1)
users2.is(relationship: "Subscriber").of(trip1)

let trip2 = Entity(type: "Trip")
trip2["location"]="CANADA"
trip2["vehicle"]="BOAT"

users2.is(relationship: "Subscriber").of(trip2)

let expense1 = Entity (type: "Expense")
expense1["descr"] = "Lunch"
expense1["amount"] = "50"
expense1["trip"] = "CANADA"
expense1["user"] = "John"

let expense2 = Entity (type: "Expense")
expense2["descr"] = "Hotel"
expense2["amount"] = "150"
expense2["trip"] = "CANADA"
expense2["user"] = "Jack"

let search2 = Search<Entity>(graph:graph).for(types: "Expense").where(properties: [("user","Jack"),("trip","CANADA")],using: SearchCondition.and)

for record in search2.sync() {
  print("\n",record,"\n")
}
//: [Next](@next)
