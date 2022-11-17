private class Rectangle {
    
    fileprivate(set) var sideA: Double
    fileprivate(set) var sideB: Double
    
    var perimeter: Double {
        sideA * 2 + sideB * 2
    }
    
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA
        self.sideB = sideB
    }
    
    func set(sideA: Double) {
        self.sideA = sideA
    }
    
    func set(sideB: Double) {
        self.sideB = sideB
    }
    
}

private class Square: Rectangle {
    
    init(side: Double) {
        super.init(sideA: side, sideB: side)
    }
    
    override func set(sideA: Double) {
        self.sideA = sideA
        self.sideB = sideA
    }
    
    override func set(sideB: Double) {
        self.sideA = sideB
        self.sideB = sideB
    }
}

private func test() {
    let r1 = Rectangle(sideA: 4, sideB: 2)
    r1.set(sideA: 3)
    r1.set(sideB: 5)
    let expect1 = r1.perimeter == 16 // OK
    
    let r2: Rectangle = Square(side: 4)
    r1.set(sideA: 3)
    r1.set(sideB: 5)
    let expect2 = r1.perimeter == 16 // НЕ OK, тут 20
}
