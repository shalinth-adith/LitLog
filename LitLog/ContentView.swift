//
//  ContentView.swift
//  LitLog
//
//  Created by shalinth adithyan on 25/07/25.
//
import SwiftData
import SwiftUI



struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
     
    @State private var showingAddBookSheet = false
    
    var body: some View {
        NavigationStack {
            Text("count : \(books.count)")
                .navigationTitle("LIT LOG")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Add Book" , systemImage: "plus"){
                            showingAddBookSheet.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddBookSheet){
                    AddBookView()
                }
            
        }
    }
}

#Preview {
    ContentView()
}
