struct AnyKey: Hashable {
    var underlying: Any
    var hashValueFunc: () -> Int
    var equalityFunc: (Any) -> Bool
    
    init<T: Hashable>(_ key: T) {
        underlying = key
        hashValueFunc = { key.hashValue }
        equalityFunc = {
            if let other = $0 as? T {
                return key == other
            }
            return false
        }
    }
    
    var hashValue: Int { return hashValueFunc() }
}

func == (x: AnyKey, y: AnyKey) -> Bool {
    return x.equalityFunc(y.underlying)
}