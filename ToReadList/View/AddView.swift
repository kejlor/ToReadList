//
//  AddView.swift
//  ToReadList
//
//  Created by Bartosz Wojtkowiak on 17/12/2021.
//

import SwiftUI

struct AddView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var bookViewModel: BookViewModel
    @State private var titleText = ""
    @State private var authorText = ""
    @State private var pagesCountText = 0
    @State private var descriptionText = ""
    @State private var isFinished = false
    
    @State var alertTitle = ""
    @State var showAlert = false
        
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Title: ")
                    TextField("Type book title here...", text: $titleText)
                }
                HStack {
                    Text("Author")
                    TextField("Type book author here...", text: $authorText)
                }
                HStack {
                    Text("Pages count: ")
                    TextField("Type book pages count here...", value: $pagesCountText, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .foregroundColor(.secondary)
                }
                HStack {
                    Text("Description:")
                    TextField("Type book description here...", text: $descriptionText)
                }
                
                Text("Have you finished that book or you're going to read it?")
                Picker("Have you finished that book or you're going to read it?", selection: $isFinished) {
                    Text("Planning to read it.").tag(false)
                    Text("Already finished.").tag(true)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Spacer()
                
                Button {
                    saveButtonIsPressed()
                } label: {
                    Text("Add book".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(
                                gradient: fieldsAreCorrect() ? Gradient(colors: [Color("Clover"), Color("Spring")]) : Gradient(colors: [Color("Cayenne"), Color("Maraschino")]),
                                startPoint: .bottomLeading,
                                endPoint: .bottom))
                        .cornerRadius(30)
                }

            }
            .padding()
        }
        .navigationTitle("Add a book 📖")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonIsPressed() {
        if fieldsAreCorrect() {
            bookViewModel.addBook(title: titleText, author: authorText, pagesCount: pagesCountText, description: descriptionText, isFinished: isFinished)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func fieldsAreCorrect() -> Bool {
        titleTextIsApproprate() && authorTextIsAppropriate() && descriptionTextIsApproprate()
    }
    
    func titleTextIsApproprate() -> Bool {
        if titleText.count < 3 {
            alertTitle = "Your title is too short. Please input correct title!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func authorTextIsAppropriate() -> Bool {
        if authorText.count < 3 {
            alertTitle = "Your author name is too short. Please input correct name!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
//    func pagesCountIsAppropriate() -> Bool {
//        if pagesCountText.count < 2 {
//            alertTitle = "Your book pages count is too short. Please input correct pages count!"
//            showAlert.toggle()
//            return false
//        }
//        return true
//    }
    
    func descriptionTextIsApproprate() -> Bool {
        if descriptionText.count < 3 {
            alertTitle = "Your description is too short. Please input correct description!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    struct AddView_Previews: PreviewProvider {
        static var previews: some View {
            AddView()
        }
    }
}
