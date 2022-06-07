
public func Add(_ a: Int32, _ b: Int32) -> Int32 {
    return a + b    
}

public func Sub(_ a: Int32, _ b: Int32) -> Int32 {
    return a - b
}

public func Mul(_ a: Int32, _ b: Int32) -> Int32 {
    return a * b
}

public func Div(_ a: Int32, _ b: Int32) -> Int32? {
    guard b != 0 else {
        return nil
    }
    return a / b
}
