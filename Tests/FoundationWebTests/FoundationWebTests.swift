import XCTest
@testable import FoundationWeb

final class FoundationWebTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FoundationWeb().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
