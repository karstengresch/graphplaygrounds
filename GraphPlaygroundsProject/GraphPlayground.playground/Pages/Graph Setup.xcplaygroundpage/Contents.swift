//: [Previous](@previous)

import Foundation
import Graph

let graph = Graph()

let unitA = Entity(type: "Unit")
unitA["name"] = "UnitA"
unitA["isExpensive"] = true

let unitB = Entity(type: "Unit")
unitB["name"] = "UnitB"
unitB["isExpensive"] = false

let unitC = Entity(type: "Unit")
unitC["name"] = "UnitB"
unitC["isExpensive"] = false

graph.sync()

//: [Next](@next)
