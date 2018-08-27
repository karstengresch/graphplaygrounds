//: [Previous](@previous)
// Basically derived from source

import Foundation
import Graph

let graph = Graph()
graph.clear()

let sectionA = Entity(type: "Section")
sectionA["id"] = 12
sectionA["name"] = "SectionA"

let sectionB = Entity(type: "Section")
sectionB["id"] = 2
sectionB["name"] = "SectionB"

let unitA = Entity(type: "Unit")
unitA["id"] = 122
unitA["name"] = "UnitA"
unitA["isExpensive"] = true
unitA.is(relationship: "UnitOfSection").of(sectionA)

let unitB = Entity(type: "Unit")
unitB["id"] = 19
unitB["name"] = "UnitB"
unitB["isExpensive"] = false
unitB.is(relationship: "UnitOfSection").of(sectionB)


let unitC = Entity(type: "Unit")
unitC["id"] = 7
unitC["name"] = "UnitC"
unitC["isExpensive"] = true
unitC.is(relationship: "UnitOfSection").of(sectionA)

graph.sync()

let unitsSearch = Search<Entity>(graph: graph).for(types: "Unit")
let units = unitsSearch.sync()

print("Search brought \(unitsSearch.sync().count) items.")

let unitResult = units.filter( { (unit) -> Bool in
  return unit.relationship(types: "UnitOfSection").count > 0
})

//: [Next](@next)
