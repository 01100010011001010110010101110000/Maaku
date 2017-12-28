//
//  ListItemSpec.swift
//  MaakuTests
//
//  Created by Kris Baker on 12/20/17.
//  Copyright © 2017 Kristopher Baker. All rights reserved.
//

@testable import Maaku
import Nimble
import Quick
import XCTest

class ListItemSpec: QuickSpec {

    override func spec() {

        describe("ListItem") {
            let text = """
+  Swift
+  Objective-C
+  C
"""

            do {
                let document = try Document(text: text)

                it("initializes the document") {
                    expect(document.count).to(equal(1))
                }

                it("parses the list items") {
                    expect(document[0]).to(beAKindOf(UnorderedList.self))
                    // swiftlint:disable force_cast
                    let list = document[0] as! UnorderedList
                    expect(list.items.count).to(equal(3))

                    for item in list.items {
                        expect(item).to(beAKindOf(ListItem.self))
                    }
                }
            } catch let error {
                it("fails to initialize the document") {
                    fail("\(error.localizedDescription)")
                }
            }
        }
    }

}
