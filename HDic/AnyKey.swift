// see http://stackoverflow.com/questions/24119624/how-to-create-dictionary-that-can-hold-anything-in-key-or-all-the-possible-type
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