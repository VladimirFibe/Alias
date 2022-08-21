//
//  ViewController.swift
//  Alias
//
//  Created by Vladimir Fibe on 21.08.2022.
//

import SwiftUI

class ViewController: UIViewController {
  var game = Game()
  let backView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.layer.cornerRadius = 30
    $0.layer.borderColor = UIColor.black.cgColor
    $0.layer.borderWidth = 1
    $0.backgroundColor = .lightGray
    return $0
  } (UIView())
  
  let cardView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.layer.cornerRadius = 30
    $0.layer.borderColor = UIColor.black.cgColor
    $0.layer.borderWidth = 1
    $0.backgroundColor = .lightGray
    
    return $0
  } (UIView())
  
  let titleLabel: UILabel = {
    $0.text = "Загадка"
    $0.font = .systemFont(ofSize: 40)
    $0.textColor = .black
    $0.textAlignment = .center
    $0.numberOfLines = 0
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())
  var panGesture = UIPanGestureRecognizer()
  let thumbImageView: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.alpha = 0
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIImageView(image: UIImage(systemName: "hand.thumbsup.fill")?.withTintColor(.green, renderingMode: .alwaysOriginal)))
  override func viewDidLoad() {
    super.viewDidLoad()
    game.createGame(topic: topics.newYear.rawValue, round: 1)
    titleLabel.text = game.getWord(result: .skip)
    view.addSubview(backView)
    view.addSubview(cardView)
    cardView.addSubview(titleLabel)
    cardView.addSubview(thumbImageView)

    panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCard))
    cardView.addGestureRecognizer(panGesture)
    
    NSLayoutConstraint.activate([
      backView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      backView.widthAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 0.66),
      backView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      view.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: 50),
      
      cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      cardView.widthAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 0.66),
      cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      view.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 50),
      
      titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: cardView.topAnchor, multiplier: 1),
      cardView.bottomAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
      titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: cardView.leadingAnchor, multiplier: 1),
      cardView.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1),
      thumbImageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
      thumbImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
      thumbImageView.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.5),
      thumbImageView.heightAnchor.constraint(equalTo: thumbImageView.widthAnchor)
    ])
  }
  
  @objc func panCard(_ sender: UIPanGestureRecognizer) {
    guard let card = sender.view else { return }
    let point = sender.translation(in: view)
    card.center = CGPoint(x: view.center.x + point.x,
                          y: view.center.y + point.y)
    let xFromCenter = card.center.x - view.center.x
    let absXFromCenter = abs(xFromCenter)
    let isRight = xFromCenter > 0
    var scale: CGFloat = 1.0
    if absXFromCenter > 100 {
      scale = 100 / absXFromCenter
    }
    thumbImageView.alpha = absXFromCenter / view.center.x
    thumbImageView.tintColor = isRight ? .green : .red
    thumbImageView.image = UIImage(systemName: isRight ? "hand.thumbsup.fill" : "hand.thumbsdown.fill")
    
    card.transform = CGAffineTransform(rotationAngle: xFromCenter / (view.frame.height - card.center.y)).scaledBy(x: scale, y: scale)
    if sender.state == UIGestureRecognizer.State.ended {
      
      if card.center.x < 75 {
        UIView.animate(withDuration: 0.2, animations: {
          card.center = CGPoint(x: card.center.x - 200,
                                y: card.center.y + 75)
          card.alpha = 0
        }) { _ in
          self.resetCard()
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            card.alpha = 1
            self.titleLabel.text = self.game.getWord(result: .fail)
          }
        }
      } else if card.center.x > (view.frame.width - 75) {
        
        UIView.animate(withDuration: 0.2, animations: {
          card.center = CGPoint(x: card.center.x + 200,
                                y: card.center.y + 75)
          card.alpha = 0
        }) { _ in
          self.resetCard()
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            card.alpha = 1
            self.titleLabel.text = self.game.getWord(result: .yes)
          }
        }
      } else {
        resetCard()
      }
    }
  }
  func resetCard() {
    UIView.animate(withDuration: 0.2) {
      self.cardView.center = self.view.center
      self.thumbImageView.alpha = 0
      self.cardView.transform = .identity
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
