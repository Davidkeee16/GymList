//
//  ViewController.swift
//  gymList
//
//  Created by David Puksanskis on 08/07/2025.
//

import UIKit

class BuildMusclesViewController: UIViewController {
    

    var exercises: [ExerciseEntity] = []
    
    var getList: [ExerciseEntity] {
        return exercises
    }
    
    var filteredExercise: [ExerciseEntity] = []
    var searchController = UISearchController(searchResultsController: nil)
    
    struct Cells {
        static let exerciseCell = "ExerciseCell"
    }

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Build muscles"
        configTableView()
        setupSearchBar()
        
        
        loadData()
                
       
    }
    private func loadData() {
        
        exercises = CoreDataManager.shared.fetchExercise()
        
        if exercises.isEmpty {
            ExerciseAPI.fetchAndSaveExercises(from: "build-muscle") { [weak self] in
                DispatchQueue.main.async {
                    self?.exercises = CoreDataManager.shared.fetchExercise()
                    self?.tableView.reloadData()
                }
                
            }
        } else {
            tableView.reloadData()
        }
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






extension BuildMusclesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let inSearchMode = self.inSearchMode(searchController)
        return inSearchMode ? self.filteredExercise.count : self.getList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let inSearchMode = self.inSearchMode(searchController)
        let exercise = inSearchMode ? self.filteredExercise[indexPath.row] : self.getList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.exerciseCell) as! ListCell
        
        
        
        cell.set(image: exercise)
       
        
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = ExerciseInfoViewController()
        vc.exercise = exercises[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: false)
        
        
        
        let inSearchMode = self.inSearchMode(searchController)
        
        
    }
    
    
    
    
}

extension BuildMusclesViewController: UISearchBarDelegate {
    
    func setupSearchBar() {
    
       
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search Muscle group"
        searchController.delegate = self
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
}

extension BuildMusclesViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
        self.updateSearchController(searchBarText: searchController.searchBar.text)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        self.tableView.reloadData()
        
    }
    
    

}

extension BuildMusclesViewController {
    
    public func inSearchMode(_ searchController: UISearchController) -> Bool {
        
        let isActive = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""
        
        return isActive && !searchText.isEmpty
    }
    
    public func updateSearchController(searchBarText: String?) {
        
        if let searchText = searchBarText?.lowercased(), !searchText.isEmpty {
                    filteredExercise = getList.filter { $0.muscleGroup?.lowercased().contains(searchText) ?? false }
                } else {
                    filteredExercise = []
                }
                
                tableView.reloadData()
    }
    
    
    
}


















import SwiftUI


struct VCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<VCProvider.ContainerView>) -> TabBarViewController {
            return TabBarViewController()
        }
        func updateUIViewController(_ uiViewController: VCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<VCProvider.ContainerView>) {
                    }
    }
}

