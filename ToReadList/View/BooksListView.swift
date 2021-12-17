//
//  BooksListView.swift
//  ToReadList
//
//  Created by Bartosz Wojtkowiak on 16/12/2021.
//

import SwiftUI

struct BooksListView: View {
    
    @EnvironmentObject var bookViewModel: BookViewModel
    
    var body: some View {
        ZStack {
            List {
                ForEach(bookViewModel.books) { book in
                    NavigationLink(destination: DetailBookView(book: book)) {
                        BookRowView(book: book)
                    }
                }
                .onDelete(perform: bookViewModel.deleteBook)
                .onMove(perform: bookViewModel.moveBook)
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Books List 📚")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView()))
    }
}

struct BooksListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BooksListView()
        }
        .environmentObject(BookViewModel())
    }
}
