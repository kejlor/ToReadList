//
//  EditDetailBookView.swift
//  ToReadList
//
//  Created by Bartosz Wojtkowiak on 18/12/2021.
//

import SwiftUI

struct EditDetailBookView: View {
    
    let book: BookModel
    @EnvironmentObject var bookViewModel: BookViewModel
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var isEditing: Bool
    @State private var titleText = ""
    @State private var authorText = ""
    @State private var pagesCountText = 0
    @State private var descriptionText = ""
    @State private var isFinished = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack {
                Image(systemName: "doc.fill")
                TextField("Title: \(book.title)", text: $titleText)
            }
            HStack {
                Image(systemName: "person.fill")
                TextField("Author: \(book.author)", text: $authorText)
            }
            HStack {
                Image(systemName: "book.circle.fill")
                Text("Pages: \(book.pagesCount)")
                TextField("Type book pages count here...", value: $pagesCountText, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .foregroundColor(.secondary)
            }
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(book.isFinished ? .green : .red)
                    Text("Current status: \(book.isFinished ? "Finished" : "Still reading")")
                }
                Text("Have you finished that book or you're going to read it?")
                Picker("Have you finished that book or you're going to read it?", selection: $isFinished) {
                    Text("Planning to read it.").tag(false)
                    Text("Already finished.").tag(true)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            HStack {
                Image(systemName: "square.and.pencil")
                Text("Description:")
            }
            
            TextField(book.description, text: $descriptionText)
                .padding()
            
            Button {
                updateButtonIsPressed()
            } label: {
                Text("Update book".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color("Clover"), Color("Spring")]),
                            startPoint: .bottomLeading,
                            endPoint: .bottom))
                    .cornerRadius(30)
            }
            
            Spacer()
            Spacer()
        }
        .padding()
    }
    func getBookPageCount() {
        pagesCountText = book.pagesCount
    }
    
    func updateButtonIsPressed() {
        bookViewModel.updateBookModel(bookModel: book, title: titleText == "" ? book.title : titleText, author: authorText == "" ? book.author : titleText, pagesCount: pagesCountText == 0 ? book.pagesCount : pagesCountText, description: descriptionText == "" ? book.description : descriptionText, isFinished: isFinished == book.isFinished ? book.isFinished : isFinished)
        self.isEditing.toggle()
    }
}

struct EditDetailBookView_Previews: PreviewProvider {
    static var previews: some View {
        EditDetailBookView(book: BookModel(title: "Poppy wars", author: "Liang", pagesCount: 650, description: "Young girl is trying to leave her shitty hometown.", isFinished: false), isEditing: .constant(true))
    }
}
