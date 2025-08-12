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
    @Query(sort:
            [SortDescriptor(\Book.title),
             SortDescriptor(\Book.author)
        ]) var books: [Book]
    
    @State private var showingAddBookSheet = false
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(books){ book in
                    NavigationLink(value : book){
                        HStack{
                            AddEmojiView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading, spacing: 2){
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    
                }
                .onDelete(perform: deleteBooks)
                
                
                
            }
            .navigationTitle("LIT LOG")
            .navigationDestination(for: Book.self) { book in
                DetailView(book : book)
                
            }
            .toolbar{
                ToolbarItem(placement:.topBarLeading){
                    EditButton()
                }
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
        func deleteBooks(at offsets: IndexSet) {
            for offset in offsets {
                let book = books[offset]

                modelContext.delete(book)
            }
        }
    
}



#Preview {
    ContentView()
}
