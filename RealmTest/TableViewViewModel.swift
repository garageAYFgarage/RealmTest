//
//  TableViewViewModel.swift
//  RealmApp
//
//  Created by iFARA💻 on 25.10.2022.
//

import Foundation
import RealmSwift

protocol TableViewViewModelProtocol {
    var dataSource: [String] { get set }
    var numberOfRows: Int { get }
    
    func getCellTitle(at indexPath: IndexPath) -> String
    func selectedElement(at indexPath: IndexPath) -> String
}

final class TableViewViewModel: TableViewViewModelProtocol {
    
    var dataSource = ["One", "Two", "Three"]
    var numberOfRows: Int {
        dataSource.count
    }
    
    func getCellTitle(at indexPath: IndexPath) -> String {
        "\(dataSource[indexPath.row])"
    }
    func selectedElement(at indexPath: IndexPath) -> String {
        "\(dataSource[indexPath.row])"
    }
}

// +
