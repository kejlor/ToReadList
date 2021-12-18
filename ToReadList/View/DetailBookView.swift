//
//  DetailBookView.swift
//  ToReadList
//
//  Created by Bartosz Wojtkowiak on 17/12/2021.
//

import SwiftUI

struct DetailBookView: View {
    
    let book: BookModel
    @EnvironmentObject var bookViewModel: BookViewModel
    
    @State private var isEditing = false
    @State private var titleText = ""
    @State private var authorText = ""
    @State private var pagesCountText = 0
    @State private var descriptionText = ""
    @State private var isFinished = false
    
    var body: some View {
        NavigationView {
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
                ScrollView {
                    Text(book.description)
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                
                Spacer()
                Spacer()
            }
            .padding()
        }
        .navigationBarItems(trailing: Button(action: {
            isEditing.toggle()
        }, label: {
            Text("Edit".uppercased())
        }))
        .sheet(isPresented: $isEditing) {
            EditDetailBookView(book: book, isEditing: $isEditing)
        }
    }
}

struct DetailBookView_Previews: PreviewProvider {
    static var previews: some View {
        DetailBookView(book: BookModel(title: "Poppy wars", author: "Liang", pagesCount: 650, description: "Young girl is trying to leave her shitty hometown. Young girl is trying to leave her shitty hometown. Young girl is trying to leave her shitty hometown. Young girl is trying to leave her shitty hometown. Young girl is trying to leave her shitty hometown. Young girl is trying to leave her shitty hometown. Young girl is trying to leave her shitty hometown. Young girl is trying to leave her shitty hometown. Young girl is trying to leave her shitty hometown. Young girl is trying to leave her shitty hometown. Young girl is trying to leave her shitty hometown. Young girl is trying to leave her shitty hometown. Young girl is trying to leave her shitty hometown.", isFinished: false))
    }
}
