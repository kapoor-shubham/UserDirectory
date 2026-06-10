//
//  CustomError.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import Foundation

protocol CustomErrorProtocol: LocalizedError {
    var title: String { get }
    var code: Int { get }
    var detail: String { get }
}

struct CustomError: CustomErrorProtocol {
    var title: String
    var code: Int
    var detail: String
}
