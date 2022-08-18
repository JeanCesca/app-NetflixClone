//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Jean Ricardo Cesca on 11/07/22.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
