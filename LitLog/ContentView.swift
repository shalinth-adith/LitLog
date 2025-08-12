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
                
                
                
            }
            .navigationTitle("LIT LOG")
            .navigationDestination(for: Book.self) { book in
                DetailView(book : book)
                
            }
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
