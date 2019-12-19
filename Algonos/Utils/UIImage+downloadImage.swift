//
//  UIImage+downloadImage.swift
//  Algonos
//
//  Created by Tristan on 12/19/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {

    convenience init?(withContentsOfUrl url: URL) throws {
        let imageData = try Data(contentsOf: url)
        self.init(data: imageData)
    }
  
    func downloadImage(from url: String) -> UIImage? {
        guard let url = URL(string: url) else { return nil }
        var image: UIImage? = nil
        do {
            image = try UIImage(withContentsOfUrl: url)
        } catch (let err) { print(err) }
        return image
    }

}
