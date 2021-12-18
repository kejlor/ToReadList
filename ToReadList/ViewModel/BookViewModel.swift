//
//  BookViewModel.swift
//  ToReadList
//
//  Created by Bartosz Wojtkowiak on 16/12/2021.
//

import Foundation

class BookViewModel: ObservableObject {
    
    @Published var books: [BookModel] = [] {
        didSet {
            saveBooks()
        }
    }
      
    let booksKey = "books_list"
    
    init() {
        getBooks()
    }
    
    func getBooks() {
        guard
            let data = UserDefaults.standard.data(forKey: booksKey),
            let savedBooks = try? JSONDecoder().decode([BookModel].self, from: data)
        else { return }
        
        self.books = savedBooks
    }
    
    func deleteBook(indexSet: IndexSet) {
        books.remove(atOffsets: indexSet)
    }
    
    func moveBook(from: IndexSet, to: Int) {
        books.move(fromOffsets: from, toOffset: to)
    }
    
    func addBook(title: String, author: String, pagesCount: Int, description: String, isFinished: Bool) {
        let newBook = BookModel(title: title, author: author, pagesCount: pagesCount, description: description, isFinished: isFinished)
        books.append(newBook)
    }
    
    func updateBook(book: BookModel) {
        if let index = books.firstIndex(where: { $0.id == book.id}) {
            books[index] = book.updateStatus()
        }
    }
    
    func saveBooks() {
        if let encodedData = try? JSONEncoder().encode(books) {
            UserDefaults.standard.set(encodedData, forKey: booksKey)
        }
    }
    
    func updateBookModel(bookModel: BookModel, title: String, author: String, pagesCount: Int, description: String, isFinished: Bool) {
        if let index = books.firstIndex(where: { $0.id == bookModel.id }) {
            books[index] = bookModel.updateBook(title: title, author: author, pagesCount: pagesCount, desription: description, isFinished: isFinished)
        }
    }
}
