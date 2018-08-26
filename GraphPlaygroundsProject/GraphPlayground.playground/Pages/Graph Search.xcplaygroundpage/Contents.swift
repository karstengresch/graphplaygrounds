//: [Previous](@previous)

import Foundation
import Graph

let graph = Graph()

let unitA = Entity(type: "Unit")
unitA["name"] = "UnitA"
unitA["isExpensive"] = true
unitA["id"]: Int = 122

let unitB = Entity(type: "Unit")
unitB["name"] = "UnitB"
unitC["isExpensive"] = false
unitB["id"]: Int = 19

let unitC = Entity(type: "Unit")
unitC["name"] = "UnitC"
unitC["isExpensive"] = true
unitC["id"]: Int = 190

graph.sync()

let basicSearch = Search<Entity>(graph: graph).for(types: "Unit")
basicSearch.sync()
print("Search brought \(basicSearch.count) items.")

//let unitsSorted = Search<Entity>(graph: graph).for(types: "Unit").sync().sorted(by: { (a: Entity, b: Entity) -> Bool in
//  return (a["id"] as! Int) < (b["id"] as! Int)
//})
//
//for unit in unitsSorted {
//  if let name = unit["name"] {
//    print("Unit ID: \(unit.id) name: \(name)")
//  }
//}

//: [Next](@next)
