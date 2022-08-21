//
//  ViewController.swift
//  Alias
//
//  Created by Vladimir Fibe on 21.08.2022.
//

import SwiftUI

class ViewController: UIViewController {
  let cardView = UIView()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(cardView)
    cardView.backgroundColor = .systemBlue
    cardView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      cardView.widthAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 0.66),
      cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      view.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 50),
    ])
  }
}

struct SwiftUIController: UIViewControllerRepresentable {
  typealias UIViewControllerType = ViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    let viewController = UIViewControllerType()
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
  }
}

struct SwiftUIController_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIController()
      .edgesIgnoringSafeArea(.all)
  }
}
