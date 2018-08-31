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

let unitD = Entity(type: "Unit")
unitD["name"] = "UnitD"
unitD["isExpensive"] = false
unitD["id"] = 4
unitD.is(relationship: "UnitOfSection").of(sectionA)

graph.sync()

let allUnits = Search<Entity>(graph: graph).for(types: "Unit")
print("Search brought \(allUnits.sync().count) items.")

// Source: Orkhan Alikhanov at https://stackoverflow.com/a/52119747/4295602
let filteredUnits = Search<Entity>(graph: graph).for(types: "Unit").sync().filter { entity in
  (entity["isExpensive"] as? Bool) == false &&
    entity.relationship(types: "UnitOfSection").contains(where: { relationship in
      relationship.object == sectionA
    })
}

print("Filtered search brought \(filteredUnits.count) items.")

for unit in filteredUnits {
  print("Name: \(unit["name"])")
}

//: [Next](@next)
