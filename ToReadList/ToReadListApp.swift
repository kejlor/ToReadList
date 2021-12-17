//
//  ToReadListApp.swift
//  ToReadList
//
//  Created by Bartosz Wojtkowiak on 16/12/2021.
//

import SwiftUI

@main
struct ToReadListApp: App {
    
    @StateObject var bookViewModel = BookViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                BooksListView()
            }
            .environmentObject(bookViewModel)
        }
    }
}
