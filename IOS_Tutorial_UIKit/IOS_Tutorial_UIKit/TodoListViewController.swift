//
//  TodoListViewController.swift
//  IOS_Tutorial_UIKit
//
//  Created by tien.nguyen23 on 08/11/2022.
//

import Foundation
import UIKit
class ToDoListViewController: UIViewController{
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    @IBOutlet weak var todoListView: UICollectionView!
    var listTodo: [String] = ["AAA", "BBB"]
    var snapshot = Snapshot()
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        setLayoutHeader()
        
        // push data to snapshot
        snapshot.appendSections([0])
        snapshot.appendItems(listTodo)
        
        // make layout for collection view
        let configLayout = makeLayout()
        todoListView.collectionViewLayout = configLayout
        
        // Register for cell item, map data for another item in list
        let cellRegister = UICollectionView.CellRegistration {
            (cell: UICollectionViewListCell, indexPath: IndexPath, itemIndentifier: String) in
            let todo = self.listTodo[indexPath.item]
            var contentConfig = cell.defaultContentConfiguration()
            contentConfig.text = todo
            cell.contentConfiguration = contentConfig
        }
        dataSource = DataSource(collectionView: todoListView) {(collectionView: UICollectionView, indexPath: IndexPath, item: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegister, for: indexPath, item: item)
        }
        dataSource.apply(snapshot)
        todoListView.dataSource = dataSource
    }
    
    func setLayoutHeader() {
        let buttonAdd = UIBarButtonItem(title: "Add", style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleAddItemTodo(sender:)))
        navigationItem.setRightBarButton(buttonAdd, animated: true)
    }
    
    
    // Handle config layout
    func makeLayout() -> UICollectionViewCompositionalLayout {
        var listConfig = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfig.backgroundColor = .clear
        listConfig.showsSeparators = true
        return UICollectionViewCompositionalLayout.list(using: listConfig)
    }
    
    @objc func handleAddItemTodo(sender: UIBarButtonItem) {
        let dialogAdd = UIAlertController(title: "Add todo", message: "Please enter name todo", preferredStyle: .alert)
        dialogAdd.addTextField()
        dialogAdd.textFields?[0].placeholder = "Please enter name"
        dialogAdd.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
            print(self.listTodo)
        }))
        
        dialogAdd.addAction(UIAlertAction(title: "OK", style: .destructive, handler: {
            action in
            let nameTodo = dialogAdd.textFields?[0].text ?? ""
            if !nameTodo.isEmpty {
                self.listTodo.append(nameTodo)
                print(self.listTodo)
                self.handleReloadListItem()
            }
        }))
        present(dialogAdd, animated: true)
    }
    
    @IBAction func handleNextPress(_ sender: Any) {
        performSegue(withIdentifier: "toDesignView", sender: nil)
    }
    func handleReloadListItem() {
        DispatchQueue.main.async {
            self.todoListView.reloadData()
        }
    }
}
