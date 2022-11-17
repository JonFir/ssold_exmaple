private class Rectangle {
    
    let sideA: Double
    let sideB: Double
    
    var perimeter: Double {
        sideA * 2 + sideB * 2
    }
    
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA
        self.sideB = sideB
    }
    
}

private class Square: Rectangle {
    init(side: Double) {
        super.init(sideA: side, sideB: side)
    }
}


private func test() {
    let r1 = Rectangle(sideA: 4, sideB: 2)
    let expect1 = r1.perimeter == 12 // OK
    
    let r2: Rectangle = Square(side: 4)
    let expect2 = r1.perimeter == 16 // OK
}
