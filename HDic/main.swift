import Foundation

struct ConcreteRelation: Relation {
    typealias Key = Any
    typealias Value = Any
}

var h1 = HDic<ConcreteRelation>()
var h2 = h1.add("string", v: "string")
var h3 = h2.add(2, v: 1)

//var h4 = h3.add(1.0, v: true)

print(h3.get("string"))
print("Hello, World!")



