//
//  InlineCodeSpec.swift
//  MaakuTests
//
//  Created by Kris Baker on 12/20/17.
//  Copyright © 2017 Kristopher Baker. All rights reserved.
//

@testable import Maaku
import Nimble
import Quick
import XCTest

class InlineCodeSpec: QuickSpec {
    
    override func spec() {
        
        describe("InlineCode") {
            let md = loadExample("inlinecode")
            
            guard let text = md else {
                XCTFail("example inline code nil")
                return
            }
            
            do {
                let document = try Document(text: text)
                
                it("initializes the document") {
                    expect(document.count).to(equal(1))
                }
                
                it("parses the inline code") {
                    expect(document[0]).to(beAKindOf(Paragraph.self))
                    let paragraph = document[0] as! Paragraph
                    expect(paragraph.items.count).to(equal(2))
                    expect(paragraph.items[1]).to(beAKindOf(InlineCode.self))
                }
            }
            catch let error {
                XCTFail("\(error.localizedDescription)")
            }
        }
    }
    
}
