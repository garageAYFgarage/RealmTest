//
//  TaskListViewController.swift
//  RealmTest
//
//  Created by iFARA💻 on 28.10.2022.
//

import Foundation
import RealmSwift

class TaskListViewController: UITableViewController {
    
    
        var taskLists: Results<TaskList>!
    
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskLists = realm.objects(TaskList.self)
        
        let shoppingList = TaskList()
        shoppingList.name = "Shopping List"
        
        let moviesList = TaskList(value: ["Movies List", Date(), [["Best film ever"], ["Some another film", "", Date(), true]]])
        
        let milk = Task()
        milk.name = "Milk"
        milk.note = "2l."
        let bread = Task()
        bread.name = "Bread"
        bread.note = "1u."
        let apples = Task()
        apples.name = "Apples"
        apples.note = "5u."
        
        shoppingList.tasks.append(milk)
        shoppingList.tasks.append(bread)
        shoppingList.tasks.append(apples)
        
        DispatchQueue.main.async {
            StorageManager.shared.saveTaskLists([shoppingList, moviesList])
        }
        
        view.backgroundColor = .orange
        label.textColor = .white
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        taskLists.count
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskList" , for: indexPath) //as? TaskListCell // <-
        
//        let taskList = taskLists[indexPath.row]
//        cell.textLabel?.text = taskList.name
//        cell.detailTextLabel?.text = "\(taskList.tasks.count)"
        
        return cell
    }
    
    
    
   
}
