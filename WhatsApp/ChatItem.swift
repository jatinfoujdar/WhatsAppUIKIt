//
//  ChatItem.swift
//  WhatsApp
//
//  Created by jatin foujdar on 29/09/26.
//

import Foundation

struct ChatItem : Decodable{
    let title: String
    let description: String
    let image: ChatImage?
}

struct ChatImage: Decodable{
    let url : URL?
}

