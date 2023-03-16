//
//  SearchView .swift
//  MLB
//
//  Created by Stanley Nicholson on 3/17/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var isShowingDetailView = false

    
    var body: some View {
        NavigationView{
            VStack{
                AsyncImage(url: URL(string:"https://i.pinimg.com/originals/20/87/ed/2087edc0f70711fb47ddca47b58face5.jpg")){ image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 300)
                .padding()
                HStack{
                    Text("Comic Character:")
                        .padding()
                    TextField(
                        "Enter Comic Character..",
                        text: $searchText
                    ).padding()
                }.padding()
                NavigationLink(destination: ContentView(name: searchText), isActive: $isShowingDetailView) {
                               Text("I Chose You")
                           }
                           .navigationTitle("Choose Your Character!")
            }
        }
    }
}

struct SearchView__Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
