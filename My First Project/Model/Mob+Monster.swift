//
//  Mob+Monster.swift
//  Olá Mundo
//
//  Created by Vinicius Floriano on 22/05/23.
//

import Foundation

extension Mob {
    enum Monster {
        case rat
        case bigRat
        
        var baseLife: Float {
            switch self {
            case .rat:
                return 10
            case .bigRat:
                return 50
            }
        }
    }
}
