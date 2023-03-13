import XCTest
@testable import PunaUI

final class PunaUITests: XCTestCase {
    func testExample() throws {
        let bundle = PunaBundle.bundle()
        let image = UIImage(named: "Puna_ui_visibility_on_24", in: bundle, compatibleWith: nil)
        XCTAssertNotNil(image)
    }
}
