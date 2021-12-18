//
//  BookModel.swift
//  ToReadList
//
//  Created by Bartosz Wojtkowiak on 16/12/2021.
//

import Foundation

struct BookModel: Identifiable, Codable {
    let id: UUID
    let title: String
    let author: String
    let pagesCount: Int
    let description: String
    let isFinished: Bool
    
    init(id: UUID = UUID(), title: String, author: String, pagesCount: Int, description: String, isFinished: Bool) {
        self.id = id
        self.title = title
        self.author = author
        self.pagesCount = pagesCount
        self.description = description
        self.isFinished = isFinished
    }
    
    func updateStatus() -> BookModel {
        return BookModel(id: id, title: title, author: author, pagesCount: pagesCount, description: description, isFinished: !isFinished)
    }
    
    func updateBook(title: String, author: String, pagesCount: Int, desription: String, isFinished: Bool) -> BookModel {
        return BookModel(id: id, title: title, author: author, pagesCount:
                            pagesCount, description: desription, isFinished: isFinished)
    }
}
