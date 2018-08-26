//: [Previous](@previous)

import Foundation
import Graph

let graph = Graph()

let unitA = Entity(type: "Unit")
unitA["name"] = "UnitA"
unitA["isExpensive"] = true
unitA["id"] = 122

let unitB = Entity(type: "Unit")
unitB["name"] = "UnitB"
unitB["isExpensive"] = false
unitB["id"] = 19

let unitC = Entity(type: "Unit")
unitC["name"] = "UnitC"
unitC["isExpensive"] = true
unitC["id"] = 7

graph.sync()

let basicSearch = Search<Entity>(graph: graph).for(types: "Unit")
print("Search brought \(basicSearch.sync().count) items.")

let unitsSorted = Search<Entity>(graph: graph).for(types: "Unit").sync().sorted(by: {
  (a: Entity, b: Entity) -> Bool in
    return (a["id"] as! Int) < (b["id"] as! Int)
})

for unit in unitsSorted {
  if let name = unit["name"], let id = unit["id"] {
    print("Unit ID: \(id) name: \(name)")
  }
}

//: [Next](@next)
