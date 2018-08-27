//: [Previous](@previous)

import Foundation
import Graph

let graph = Graph()
graph.clear()

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

let unitsRaw = Search<Entity>(graph: graph).for(types: "Unit").sync()
print("Search brought \(unitsRaw.count) items.")

print("\nRaw Result")
for unitRaw in unitsRaw {
  if let name = unitRaw["name"], let id = unitRaw["id"] {
    print("Unit ID: \(id) name: \(name)")
  }
}

let unitsSorted = Search<Entity>(graph: graph).for(types: "Unit").sync().sorted(by: {
  (a: Entity, b: Entity) -> Bool in
    return (a["id"] as! Int) < (b["id"] as! Int)
})

print("\n Sorted Result")
for unit in unitsSorted {
  if let name = unit["name"], let id = unit["id"] {
    print("Unit ID: \(id) name: \(name)")
  }
}

let unitBOnly = Search<Entity>(graph: graph).for(types: "Unit").where(properties: ("name", "UnitB"))

//: [Next](@next)
