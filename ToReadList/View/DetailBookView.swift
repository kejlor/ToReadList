//
//  DetailBookView.swift
//  ToReadList
//
//  Created by Bartosz Wojtkowiak on 17/12/2021.
//

import SwiftUI

struct DetailBookView: View {
    
    let book: BookModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack {
                Image(systemName: "doc.fill")
                Text("Title: \(book.title)")
            }
            HStack {
                Image(systemName: "person.fill")
                Text("Author: \(book.author)")
            }
            HStack {
                Image(systemName: "book.circle.fill")
                Text("Pages: \(book.pagesCount)")
            }
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(book.isFinished ? .green : .red)
                Text("Current status: \(book.isFinished ? "Finished" : "Still reading")")
            }
            HStack {
                Image(systemName: "square.and.pencil")
                Text("Description:")
            }
            
            Text(book.description)
                .padding()
            
            Spacer()
            Spacer()
        }
        .padding()
        .navigationBarItems(trailing: EditButton())
    }
}

struct DetailBookView_Previews: PreviewProvider {
    static var previews: some View {
        DetailBookView(book: BookModel(title: "Poppy wars", author: "Liang", pagesCount: 650, description: "Young girl is trying to leave her shitty hometown.", isFinished: false))
    }
}
