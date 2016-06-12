import Foundation

struct ConcreteRelation: Relation {
    typealias Key = Any
    typealias Value = Any
}

extension HDic where R.Key == String, R.Value == String {
    func get(k: String) -> Optional<String> {
        return _get(k)
    }
    
    func add(k: String, v: String) -> HDic<R> {
        return _add(k, v: v)
    }
}

extension HDic where R.Key == Int, R.Value == Int {
    func get(k: Int) -> Optional<Int> {
        return _get(k)
    }
    
    func add(k: Int, v: Int) -> HDic<R> {
        return _add(k, v: v)
    }
}

var h1 = HDic<ConcreteRelation>()
var h2 = h1.add("string", v: "string")
var h3 = h2.add(2, v: 1)

print(h3.get("string"))


