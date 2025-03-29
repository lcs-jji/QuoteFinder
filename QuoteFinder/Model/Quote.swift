//
//  Quote.swift
//  QuoteFinder
//
//  Created by Xinchen Ji on 2025-03-29.
//

import Foundation


struct Quote: Codable {
    
    let quoteText: String?
    let quoteAuthor: String?
    let senderName: String
    let senderLink: String
    let quoteLink: String
        
}

let exampleQuote = Quote(
    quoteText:"In order to win, you must expect to win.  ",
       quoteAuthor:"Richard Bach ",
       senderName:"",
       senderLink:"",
       quoteLink:"http://forismatic.com/en/3c6bb96af5/"
    
)
