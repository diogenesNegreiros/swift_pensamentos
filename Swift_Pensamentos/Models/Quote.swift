//
//  Quote.swift
//  Swift_Pensamentos
//
//  Created by Diogenes de Souza on 27/05/21.
//

import Foundation

struct Quote {
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        return "❝" + quote + "❞"
    }
    
    var authorFormatted: String {
        return "❝" + author + "❞"
    }
}
