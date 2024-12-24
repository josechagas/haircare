//
//  Array+Coordinator.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 24/12/24.
//

extension Array where Element == any Coordinator {
    func first<C>(where type: C.Type) -> C? {
        first(where: {$0 is C}) as? C
    }
}
