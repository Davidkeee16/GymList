//
//  ExerciseInfoViewController.swift
//  gymList
//
//  Created by David Puksanskis on 09/07/2025.
//

import UIKit

class ExerciseInfoViewController: UIViewController {
    
    
    
    var exercise: ExerciseEntity!
    
    let setsLabel = UILabel(text: "0")
    let repsLabel = UILabel(text: "0")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewDetail()
        
        setValue()
        
    }
    
    private func viewDetail() {
        
        setsLabel.translatesAutoresizingMaskIntoConstraints = false
        repsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(setsLabel)
        view.addSubview(repsLabel)
        
        NSLayoutConstraint.activate([
            setsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            setsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60)
        ])
        NSLayoutConstraint.activate([
            repsLabel.topAnchor.constraint(equalTo: setsLabel.bottomAnchor, constant: 10),
            repsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60)
        ])
    }
    private func setValue() {
        
        guard exercise != nil else { return }
        
        setsLabel.text = "sets: \(exercise.sets)"
        repsLabel.text = "reps: \(exercise.reps)"
    }
    
}




import SwiftUI


struct ExerciseVCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ExerciseVCProvider.ContainerView>) -> ExerciseInfoViewController {
            return ExerciseInfoViewController()
        }
        func updateUIViewController(_ uiViewController: ExerciseVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ExerciseVCProvider.ContainerView>) {
                    }
    }
}

