import XCTest
@testable import PunaUI

final class PunaUITests: XCTestCase, PunaListDelegate, PunaListDataSource {
    
    func testExample() throws {
        let bundle = PunaBundle.bundle()
        let image = PunaUIAssets.punaControlYAccionBuscar16
        XCTAssertNotNil(image)
    }
    func testPunaList() throws {
        let list = PunaUI.PunaList()
        list.delegate = self
        list.dataSource = self
        list.reloadData()
        XCTAssertNotNil(list)
    }
    func testPunsSimpleCell() throws {
        let nibFile = UINib(nibName: "PunaListSimpleViewCell",
                            bundle: PunaBundle.bundle())
        XCTAssertNotNil(nibFile)
        let customCell = PunaSimpleCell(withTitle: "suggestion", subtitle: "asdasd")
        XCTAssertNotNil(customCell)
    }
    func PunaList(_ listView: PunaUI.PunaList, cellForRowAt indexPath: IndexPath) -> PunaUI.PunaListCell {
        let customCell = PunaSimpleCell(withTitle: "suggestion", subtitle: "asdasd")
        return customCell
    }
    
    func PunaList(_ listView: PunaUI.PunaList, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(_ listView: PunaUI.PunaList) -> Int {
        return 1
    }
}
//paseo las delicias 113 madrid
