//
//  QuotesManager.swift
//  Swift_Pensamentos
//
//  Created by Diogenes de Souza on 27/05/21.
//

import Foundation

class QuotesManager {
   
    var quotes: [Quote] = []
    
    init() {
        getQuotesInBundle()
    
    }
    
    func getQuotesInBundle() {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileURL)
        let jsonDecoder = JSONDecoder()
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData)
    }
    
    func getRandomQuote() -> Quote {
        
        if quotes.isEmpty {
            getQuotesInBundle()
            print("TODOS OS PENSAMENTOS FORAM EXIBIDOS!")
        }
        
        let index = Int (arc4random_uniform(UInt32(quotes.count)))
        let quote = quotes[index]
        quotes.remove(at: index)
        return quote
    }
    
}
