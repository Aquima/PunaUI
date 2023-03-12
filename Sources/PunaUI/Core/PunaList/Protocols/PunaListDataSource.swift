//
//  PunaListDataSource.swift
//  PunaUI
//
//  Created by Jonathan Alonso Pinto on 21/10/20.
//

import Foundation

@objc public protocol PunaListDataSource {

    @objc func PunaList(_ listView: PunaList, cellForRowAt indexPath: IndexPath) -> PunaListCell
    @objc func PunaList(_ listView: PunaList, numberOfRowsInSection section: Int) -> Int
    @objc func numberOfSections(_ listView: PunaList) -> Int

}
