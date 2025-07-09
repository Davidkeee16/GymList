//
//  BeStrongerViewController.swift
//  gymList
//
//  Created by David Puksanskis on 08/07/2025.
//

import UIKit

class BeStrongerViewController: UIViewController {
    
    var exercise: [Exercise] = []
    
    var getList: [Exercise] {
        exercise
    }
    
    struct Cells {
        static let exerciseCell = "ExerciseCell"
    }

    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configTableView()
        setupSearchBar()
        
    }
    
    
    func configTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 80
        
        tableView.pin(to: view)
        tableView.register(ListCell.self, forCellReuseIdentifier: Cells.exerciseCell)
        
    }
    
    func setTableViewDelegates() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}






extension BeStrongerViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.exerciseCell) as! ListCell
        let image = getList[indexPath.row]
        cell.set(image: image)
       
        
        
        
        return cell
        
        
    }
    
    
    
}

extension BeStrongerViewController: UISearchBarDelegate {
    
    func setupSearchBar() {
        
        let searchController = UISearchController(searchResultsController: nil)
        
        navigationItem.searchController = searchController
        
    }
}






















import SwiftUI


struct BeStrongVCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<BeStrongVCProvider.ContainerView>) -> TabBarViewController {
            return TabBarViewController()
        }
        func updateUIViewController(_ uiViewController: BeStrongVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<BeStrongVCProvider.ContainerView>) {
                    }
    }
}

