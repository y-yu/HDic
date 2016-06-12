struct HDic<R: Relation> {
    let underlying: Dictionary<AnyKey, AnyObject>
    
    internal init(_ dic: Dictionary<AnyKey, AnyObject> = Dictionary<AnyKey, AnyObject>()) {
        self.underlying = dic
    }
    
    private func _get<K: Hashable, V>(k: K) -> Optional<V> {
        return(underlying[AnyKey(k)] as? V)
    }
    
    private func _add<K: Hashable, V>(k: K, v: V) -> HDic<R> {
        var n = self.underlying
        n.updateValue(v as! AnyObject, forKey: AnyKey(k))
        return HDic(n)
    }
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