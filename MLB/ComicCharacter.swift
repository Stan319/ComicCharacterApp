//
//  Player.swift
//  MLB
//
//  Created by Stanley Nicholson on 3/15/23.
//

import Foundation
struct searchComicCharacter:Codable{
    var queryResults:query
}
struct queryrow:Codable{
    var name_display_roster:String
}
struct query:Codable{
    var row:queryrow
}
struct SearchQuery{
    static var squery = ""
}
struct ComicCharacter:Codable{
    var result:CharacterResult?
    var results:[CharacterResult]?
}
struct CharacterResult:Codable{
    var name:String
    var biography:Biography?
    var appearance:CharacterAppearance?
    var work:CharacterWork?
    var connections:CharacterConnections?
    var image:CharacterImage?
}
struct Biography:Codable{
    var full_name:String?
    //var alter_egos:[String]?
    var aliases:[String]?
    var place_of_birth:String?
    var first_appearance:String?
    var publisher:String?
    var alignment:String?
    enum CodingKeys:String,CodingKey{
        case full_name = "full-name"
      //  case alter_egos = "alter-egos"
        case aliases
        case place_of_birth = "place-of-birth"
        case first_appearance = "first-appearance"
        case publisher
        case alignment
    }
}
    struct CharacterAppearance:Codable{
        var gender:String?
        var race:String?
        var weight:[String]?
        var height:[String]?
    }
    struct CharacterWork:Codable{
        var occupation:String?
        var base:String?
    }
    struct CharacterConnections:Codable{
        var group_affiliation:String?
        var relatives:String?
        enum CodingKeys:String,CodingKey{
            case group_affiliation = "group-affiliation"
            case relatives
            
        }
        
    }
    struct CharacterImage:Codable{
        var url:String?
    }
    

