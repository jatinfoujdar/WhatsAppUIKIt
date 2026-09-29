//
//  Services.swift
//  WhatsApp
//
//  Created by jatin foujdar on 29/09/26.
//

import Foundation

enum ChatLoader {
    static func loadFromBundle() -> [ChatItem]{
        guard let fileurl = Bundle.main.url(forResource: "chats", withExtension: "json") else{
            print("chats not found")
        return[]
        }
        do{
            let data = try Data(contentsOf: fileurl)
            let items = try JSONDecoder().decode([ChatItem].self, from: data)
            return items
        }catch{
            print("decoding failed")
            return []
        }
    }
}
