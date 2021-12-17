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
            Text("Title: \(book.title)")
            Text("Author: \(book.author)")
            Text("Pages: \(book.pagesCount)")
            Text("Current reader status: \(book.isFinished ? "Finished" : "Still reading")")
            Text("Description:")
            Text(book.description)
        }
        .navigationBarItems(trailing: EditButton())
    }
}

struct DetailBookView_Previews: PreviewProvider {
    static var previews: some View {
        DetailBookView(book: BookModel(title: "Poppy wars", author: "Liang", pagesCount: 650, description: "Young girl is trying to leave her shitty hometown.", isFinished: false))
    }
}
