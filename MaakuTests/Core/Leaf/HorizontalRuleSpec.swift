//
//  HorizontalRuleSpec.swift
//  MaakuTests
//
//  Created by Kris Baker on 12/20/17.
//  Copyright © 2017 Kristopher Baker. All rights reserved.
//

@testable import Maaku
import Nimble
import Quick
import XCTest

class HorizontalRuleSpec: QuickSpec {
    
    override func spec() {
        
        describe("HorizontalRule") {
            let md = loadExample("horizontalrule")
            
            guard let text = md else {
                XCTFail("example horizontal rule nil")
                return
            }
            
            do {
                let document = try Document(text: text)
                
                it("initializes the document") {
                    expect(document.count).to(equal(1))
                }
                
                it("parses the horizontal rule") {
                    expect(document[0]).to(beAKindOf(HorizontalRule.self))
                }
            }
            catch let error {
                XCTFail("\(error.localizedDescription)")
            }
        }
    }
    
}
