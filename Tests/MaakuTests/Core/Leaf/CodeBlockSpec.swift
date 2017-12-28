//
//  CodeBlockSpec.swift
//  MaakuTests
//
//  Created by Kris Baker on 12/20/17.
//  Copyright © 2017 Kristopher Baker. All rights reserved.
//

@testable import Maaku
import Nimble
import Quick
import XCTest

class CodeBlockSpec: QuickSpec {

    override func spec() {

        describe("CodeBlock") {
            let text = """
```swift
let document = try Document(text: "This ia code block test")
```
"""

            do {
                let document = try Document(text: text)

                it("initializes the document") {
                    expect(document.count).to(equal(1))
                }

                it("parses the code block") {
                    expect(document[0]).to(beAKindOf(CodeBlock.self))
                }
            } catch let error {
                it("fails to initialize the document") {
                    fail("\(error.localizedDescription)")
                }
            }
        }
    }

}
