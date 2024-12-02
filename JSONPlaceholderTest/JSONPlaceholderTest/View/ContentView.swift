//
//  ContentView.swift
//  JSONPlaceholderTest
//

import SwiftUI

struct ContentView: View {
    
    @State private var posts: [Post] = []
    
    var body: some View {
            VStack {
                List(posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .onAppear {
                    fetchPosts { fetchedPosts in
                        posts = fetchedPosts
                    }
                }
            }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
