//
//  PagingTableView.swift
//  PlannerEvo
//
//  Created by Dmitriy Virych on 1/12/18.
//  Copyright © 2018 Dmitriy Virych. All rights reserved.
//

import UIKit

@objc protocol PagingTableViewDelegate: class {
    
    var itemsPerPage: Int { get }
    var count: Int { get }
    
    func tableView(_ tableView: PagingTableView, willDispleyPreloadingCellAt indexPath: IndexPath, withComplition complition: @escaping () -> ())
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    @objc optional func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
}

open class PagingTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    open var pageNumber = 1
    
    weak var pagingDelegate: PagingTableViewDelegate!
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        delegate = self
        dataSource = self
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (pagingDelegate.itemsPerPage * pageNumber)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return pagingDelegate.tableView(tableView, cellForRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row > ((pagingDelegate.itemsPerPage * pageNumber) - 2)  && indexPath.row < pagingDelegate.count {
            pagingDelegate.tableView(tableView as! PagingTableView, willDispleyPreloadingCellAt: indexPath) {
                
                self.pageNumber += 1
                
                tableView.reloadData()
            }
        } else {
            pagingDelegate.tableView?(tableView, willDisplay: cell, forRowAt: indexPath)
        }
    }
}
