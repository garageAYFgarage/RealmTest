//
//  ViewController.swift
//  RealmApp
//
//  Created by iFARA💻 on 20.10.2022.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

//    let itemsOfSegmentedControl = ["A-Z", "Date"]
    
    //MARK: - UIElements
//    private lazy var segmentedControl: UISegmentedControl = {
//        var segmentedControl = UISegmentedControl(items: itemsOfSegmentedControl)
//        segmentedControl.addTarget(self, action: #selector(createSuitSegmentedControl), for: .valueChanged)
//        segmentedControl.backgroundColor = .gray
//        segmentedControl.layer.borderColor = UIColor.systemOrange.cgColor
//        segmentedControl.layer.borderWidth = 3
//        segmentedControl.selectedSegmentTintColor = UIColor.green
//        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
//        segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
//        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.black]
//        segmentedControl.setTitleTextAttributes(titleTextAttributes1, for:.selected)
//        return segmentedControl
//    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
   
    //MARK: - Properties
    private let viewModel: TableViewViewModelProtocol
    
    //MARK: - LifeCycle
    init(viewModel: TableViewViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }
    //MARK: - Actions
    @objc private func createSuitSegmentedControl(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            view.backgroundColor = .systemPink
        case 1:
            view.backgroundColor = .systemIndigo
        default:
            view.backgroundColor = .gray
        }
    }
    
    //MARK: -  Private Helpers
    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .purple
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
        title = "Task Lists"
    }
    
    //MARK: - Layout
    private func setupLayout() {
//        view.addSubview(segmentedControl)
//        segmentedControl.snp.makeConstraints { make in
//            make.height.equalTo(50)
//            make.leading.equalToSuperview().offset(2)
//            make.trailing.equalToSuperview().offset(-2)
//            make.top.equalToSuperview().offset(100)
//        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}
    
    //MARK: - Helpers
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.getCellTitle(at: indexPath)
        return cell
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let element = viewModel.selectedElement(at: indexPath)
        let taskViewController = TaskListViewController()
        taskViewController.label.text = element
        navigationController?.pushViewController(taskViewController, animated: true)
    }

}




