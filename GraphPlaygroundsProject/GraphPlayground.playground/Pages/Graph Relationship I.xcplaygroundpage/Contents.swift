//: [Previous](@previous)

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

// Relationships
//sessionBeHereNow.is(relationship: "SessionOfPackage").in(object: packageTryouts)
//sessionBeHereNow.is(relationship: "SessionOfPackage").in(object: packageSupremeFocus)

let unitA = Entity(type: "Unit")
unitA["id"] = 122
unitA["name"] = "UnitA"
unitA["isExpensive"] = true
unitA.is(relationship: "UnitOfSection").in(object: sectionA)

let unitB = Entity(type: "Unit")
unitB["id"] = 19
unitB["name"] = "UnitB"
unitB["isExpensive"] = false
unitB.is(relationship: "UnitOfSection").in(object: sectionB)


let unitC = Entity(type: "Unit")
unitC["id"] = 7
unitC["name"] = "UnitC"
unitC["isExpensive"] = true
unitC.is(relationship: "UnitOfSection").in(object: sectionA)

graph.sync()

let unitsRaw = Search<Entity>(graph: graph).for(types: "Unit")
print("Search brought \(unitsRaw.sync().count) items.")

//: [Next](@next)
