//
//  Network.swift
//  MLB
//
//  Created by Stanley Nicholson on 3/15/23.
//

import Foundation
enum MyNetworkErrors:LocalizedError{
    case serial
    case network
    case other
}
class Network{
    func fetchComicCharacter< T:Decodable>(responsemodel:T.Type,squery:String) async -> Result<ComicCharacter,MyNetworkErrors>{
        let qstr=squery.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
        print(qstr)
        let Request = URLRequest(url: URL(string: "https://www.superheroapi.com/api/114605278248318/search/\(qstr)")!
        )
        do {
            let (data,response) = try await URLSession.shared.data(for: Request,delegate:nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.network)
            }
            switch response.statusCode{
            case 200...299:
                print(response.statusCode)
                guard let decodedresponse = try? JSONDecoder().decode(responsemodel, from: data)else{
                    return .failure(.serial)
                }
                return .success(decodedresponse as! ComicCharacter)
            default: break
            }
            
        }catch{
            return .failure(.network)
        }
        return.failure(.other)
    }
    
}
