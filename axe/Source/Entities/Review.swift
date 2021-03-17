//
//  Review.swift
//  axe
//
//  Created by 조선미 on 2021/01/22.
//

import Foundation

struct Review {
    let book: Book
    let bookID: String
    let rating: Double
    let tags: [String]
    let contents: [Content]
}

enum ContentType {
    case question
    case quote
    case impressions
}

struct Content {
    let type: ContentType
    let title: String
    let content: String
}
