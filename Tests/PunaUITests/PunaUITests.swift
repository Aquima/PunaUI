import XCTest
@testable import PunaUI

final class PunaUITests: XCTestCase {
    func testExample() throws {
        let bundle = PunaBundle.bundle()
        let image = PunaUIAssets.punaControlYAccionBuscar16
        XCTAssertNotNil(image)
    }
}
