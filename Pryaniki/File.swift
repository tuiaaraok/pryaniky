//
//  File.swift
//  Pryaniki
//
//  Created by Айсен Шишигин on 16/07/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation


struct Pryanik: Decodable {
    let data: [Data]?
    let view: [String]?
}

struct Data: Decodable {
    let name: String?
    let data: Data2?
}


struct Data2: Decodable {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variant]?
}

struct Variant: Decodable {
    let id: Int?
    let text: String?
}
