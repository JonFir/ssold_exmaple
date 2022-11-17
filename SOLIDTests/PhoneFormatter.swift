import XCTest
@testable import SOLID

final class SOLIDTests: XCTestCase {

    func testNeedReplaceCodeToSeven() throws {
        var result = thridFormat(
            phone: "71234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "+7-123-456-78-90")
        
        result = thridFormat(
            phone: "+71234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "+7-123-456-78-90")
        
        result = thridFormat(
            phone: "+1234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "+7-123-456-78-90")
        
        result = thridFormat(
            phone: "1234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "+7-123-456-78-90")
        
        result = thridFormat(
            phone: "81234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "+7-123-456-78-90")
        
        result = thridFormat(
            phone: "+81234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: false
        )
        XCTAssertEqual(result, "+8-123-456-78-90")
        
        result = thridFormat(
            phone: "81234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: false
        )
        XCTAssertEqual(result, "+8-123-456-78-90")
        
        result = thridFormat(
            phone: "1234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: false
        )
        XCTAssertEqual(result, "123-456-78-90")
    }
    
    func testFirstSymbol() throws {
        var result = thridFormat(
            phone: "+71234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "+7-123-456-78-90")
        
        result = thridFormat(
            phone: "+71234567890",
            separator: "-",
            firstSymbol: "*",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "*7-123-456-78-90")
        
        result = thridFormat(
            phone: "+71234567890",
            separator: "-",
            firstSymbol: "",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "7-123-456-78-90")
    }
    
    func testSeparator() throws {
        var result = thridFormat(
            phone: "+71234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "+7-123-456-78-90")
        
        result = thridFormat(
            phone: "+71234567890",
            separator: "_",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "+7_123_456_78_90")
        
        result = thridFormat(
            phone: "+71234567890",
            separator: "",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "+71234567890")
    }
    
    func testNeedFirstSeparator() throws {
        var result = thridFormat(
            phone: "+71234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "+7-123-456-78-90")
        
        result = thridFormat(
            phone: "+71234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: false,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "+7123-456-78-90")
    }
    
    func testNeedLastSeparator() throws {
        var result = thridFormat(
            phone: "+71234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "+7-123-456-78-90")
        
        result = thridFormat(
            phone: "+71234567890",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: false,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "+7-123-456-7890")
    }
    
    func testShortPhone() throws {
        var result = thridFormat(
            phone: "1235678",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "123-56-78")
        
        result = thridFormat(
            phone: "1235678",
            separator: "_",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "123_56_78")
        
        result = thridFormat(
            phone: "1235678",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: false,
            needLastSeparator: true,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "12356-78")
        
        result = thridFormat(
            phone: "1235678",
            separator: "-",
            firstSymbol: "+",
            needFirstSeparator: true,
            needLastSeparator: false,
            needReplaceCodeToSeven: true
        )
        XCTAssertEqual(result, "123-5678")
    }

}
