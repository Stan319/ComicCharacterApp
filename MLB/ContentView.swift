//
//  ContentView.swift
//  MLB
//
//  Created by Stanley Nicholson on 3/15/23.
//

import SwiftUI

struct ContentView: View {
    @State var network=Network()
    @State var characterResult:ComicCharacter?
    var name:String
    var body: some View {
        ScrollView{
            VStack {
                VStack{
                    AsyncImage(url: URL(string:(characterResult?.result ?? characterResult?.results?.first)?.image?.url ?? "")){ image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 160, height: 160)
                    .padding()
                    
                    Text((characterResult?.result ?? characterResult?.results?.first)?.name ?? "")
                        .padding()
                    Text((characterResult?.result ?? characterResult?.results?.first)?.biography?.full_name ?? "")
                        .padding()
                    Text((characterResult?.result ?? characterResult?.results?.first)?.biography?.first_appearance ?? "")
                        .padding()
                    Text((characterResult?.result ?? characterResult?.results?.first)?.biography?.aliases?.description ?? "")
                        .padding()
                    Text((characterResult?.result ?? characterResult?.results?.first)?.biography?.place_of_birth ?? "")
                        .padding()
                    Text((characterResult?.result ?? characterResult?.results?.first)?.biography?.publisher ?? "")
                        .padding()
                    Text((characterResult?.result ?? characterResult?.results?.first)?.biography?.alignment ?? "")
                        .padding()
                    Text((characterResult?.result ?? characterResult?.results?.first)?.appearance?.race ?? "")
                        .padding()
                    Text((characterResult?.result ?? characterResult?.results?.first)?.appearance?.gender ?? "")
                        .padding()
                }
                VStack{
                    Text((characterResult?.result ?? characterResult?.results?.first)?.appearance?.height?.description ?? "")
                        .padding()
                    Text((characterResult?.result ?? characterResult?.results?.first)?.appearance?.weight?.description ?? "")
                        .padding()
                    Text((characterResult?.result ?? characterResult?.results?.first)?.work?.occupation ?? "")
                        .padding()
                    Text((characterResult?.result ?? characterResult?.results?.first)?.work?.base ?? "")
                        .padding()
                    Text((characterResult?.result ?? characterResult?.results?.first)?.connections?.group_affiliation?.description ?? "")
                        .padding()
                    Text((characterResult?.result ?? characterResult?.results?.first)?.connections?.relatives ?? "")
                        .padding()
                }
            }
            .padding()
            .task {
                characterResult = try? await network.fetchComicCharacter(responsemodel: ComicCharacter.self,squery:name ).get()
                print(characterResult)
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
