//
//  DetailView.swift
//  LitLog
//
//  Created by shalinth adithyan on 12/08/25.
//
import SwiftData
import SwiftUI

struct DetailView: View {
    let book: Book
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(Color.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x:-5,y:-5)
                   
            }
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}


#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for:Book.self , configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This is a great book ", rating: 4)
        return DetailView(book : example)
            .modelContainer(container)
    }catch {
        return Text("failed to create preview :\(error.localizedDescription)")
    }
}
