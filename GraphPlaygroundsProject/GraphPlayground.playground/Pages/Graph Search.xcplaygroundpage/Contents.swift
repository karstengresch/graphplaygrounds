//: [Previous](@previous)

import Foundation
import Graph

let graph = Graph()

let unitA = Entity(type: "Unit")
unitA["name"] = "UnitA"
unitA["isExpensive"] = true

let unitC = Entity(type: "Unit")
unitC["name"] = "UnitC"
unitC["isExpensive"] = false

let unitB = Entity(type: "Unit")
unitB["name"] = "UnitB"
unitB["isExpensive"] = false

graph.sync()

let basicSearch = Search<Entity>(graph: graph).for(types: "Unit")
print("Search brought \(basicSearch.sync().count) items.")

let unitsSorted = Search<Entity>(graph: packageGraph).for(types: "Unit").sync().sorted(by: { (a: Entity, b: Entity) -> Bool in
  return (a["name"] as! Int) < (b["name"] as! Int)
})

for unit in unitsSorted {
  if let name = unit["name"] {
    print("Unit name: \(name)")
  }
}

//: [Next](@next)
