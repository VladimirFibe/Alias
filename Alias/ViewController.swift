//
//  ViewController.swift
//  Alias
//
//  Created by Vladimir Fibe on 21.08.2022.
//

import SwiftUI

class ViewController: UIViewController {
  let cardView = UIView()
  var panGesture = UIPanGestureRecognizer()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(cardView)
    cardView.backgroundColor = .systemBlue
    cardView.translatesAutoresizingMaskIntoConstraints = false
    panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCard))
    cardView.addGestureRecognizer(panGesture)
    NSLayoutConstraint.activate([
      cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      cardView.widthAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 0.66),
      cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      view.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 50),
    ])
  }
  
  @objc func panCard(_ sender: UIPanGestureRecognizer) {
    guard let card = sender.view else { return }
    let point = sender.translation(in: view)
    card.center = CGPoint(x: view.center.x + point.x,
                          y: view.center.y + point.y)
    
    if sender.state == UIGestureRecognizer.State.ended {
      UIView.animate(withDuration: 0.2) {
        card.center = self.view.center
      }
    }
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
