//
//  BookRowFile.swift
//  ToReadList
//
//  Created by Bartosz Wojtkowiak on 17/12/2021.
//

import SwiftUI

struct BookRowView: View {
    
    let book: BookModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: book.isFinished ? "book.closed.fill" : "book.fill")
                        .foregroundColor(book.isFinished ? .green : .red)
                    Text(book.title)
                        
                }
                .font(.headline)
                Text("Author: \(book.author)")
                    .font(.callout)
            }
        }
        .padding()
    }
}

struct BookRowView_Previews: PreviewProvider {
    static var book1 = BookModel(title: "Poppey wars", author: "Liang", pagesCount: 650, description: "Young girl is trying to leave her shitty hometown.", isFinished: false)
    static var book2 = BookModel(title: "The Way of Kings", author: "Brandon Sanderson", pagesCount: 1240, description: "The best book I've read.", isFinished: true)
    static var previews: some View {
        Group {
            BookRowView(book: book1)
            BookRowView(book: book2)
        }
    }
}
