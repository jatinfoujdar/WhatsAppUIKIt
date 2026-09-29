//
//  ImageLoader.swift
//  WhatsApp
//
//  Created by jatin foujdar on 29/09/26.
//

import UIKit

final class ImageLoader {

    static let shared = ImageLoader()

    private let cache = NSCache<NSURL, UIImage>()

    private init() {}

    func load(_ url: URL, completion: @escaping (UIImage?) -> Void) {

        // 1. Check cache first
        if let cached = cache.object(forKey: url as NSURL) {
            DispatchQueue.main.async {
                completion(cached)
            }
            return
        }

        // 2. Download in background
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in

            // Network error
            guard error == nil,
                  let data = data,
                  let image = UIImage(data: data) else {

                DispatchQueue.main.async {
                    completion(nil)
                }

                return
            }

            // 3. Save to cache
            self?.cache.setObject(image, forKey: url as NSURL)

            // 4. UI callback on main thread
            DispatchQueue.main.async {
                completion(image)
            }

        }.resume()
    }
}

