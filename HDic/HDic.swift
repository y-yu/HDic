struct HDic<R: Relation> {
    private let underlying: Dictionary<AnyKey, AnyObject>
    
    internal init(_ dic: Dictionary<AnyKey, AnyObject> = Dictionary<AnyKey, AnyObject>()) {
        underlying = dic
    }
    
    func _get<K: Hashable, V>(k: K) -> Optional<V> {
        return(underlying[AnyKey(k)] as? V)
    }
    
    func _add<K: Hashable, V>(k: K, v: V) -> HDic<R> {
        var n = self.underlying
        n.updateValue(v as! AnyObject, forKey: AnyKey(k))
        return HDic(n)
    }
}