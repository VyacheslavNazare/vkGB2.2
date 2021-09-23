//
//  Like.swift
//  UI_app
//
//  Created by Вячеслав on 29.08.2021.
//

import UIKit

class Like: UIControl {
    
    private(set) var isLike: Bool = false
    private var countLike: Int = 0
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let countLable: UILabel = {
        let countLable = UILabel()
        countLable.translatesAutoresizingMaskIntoConstraints = false
        return countLable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        addGestures()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
        addGestures()
    }
    
    private func setViews() {
        addSubview(countLable)
        addSubview(imageView)
        //констрейнты
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: self.heightAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            countLable.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            countLable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLable.trailingAnchor.constraint(equalTo: imageView.leadingAnchor)
        
        ])
    }
    
    func configure(isLike: Bool, count: Int) {
        self.isLike = isLike
        countLike = count
        
        
        if isLike{
            imageView.image = UIImage(systemName: "heart.fill")
        } else {
            imageView.image = UIImage(systemName: "heart")
        }
        setLikeCounterLabel()
        
    }
    
    
    
    //Обработка нажатия
    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(controlTapped))
        imageView.isUserInteractionEnabled = true // делаем имадж кликабельным
        imageView.addGestureRecognizer(tap) // это чтобы тап по картинке был
    }
    //что будет происходить по нажатию
    @objc private func controlTapped() {
        isLike.toggle() //меняем значение на противоположное
        
        //  в зависимости нажата ли кнопка или нет будут разные картинки и +- каунты
        if isLike{
            imageView.image = UIImage(systemName: "heart.fill")
            countLike += 1
            setLikeCounterLabel()
            
        } else {
            imageView.image = UIImage(systemName: "heart")
            countLike -= 1
            setLikeCounterLabel()
        }
        
        sendActions(for: .valueChanged)
        
        
    }
    
    private func setLikeCounterLabel() {
        let likeString: String?
        // значения каунтов, которое будет указываться в зависимости от числа лайков
        switch countLike {
        case 0..<1000:
            likeString = String(self.countLike)
        case 1000..<1000000:
            likeString = String(self.countLike/1000) + "K"
        default:
            likeString = "-"
        }
        //Анимация нажатия
        UIView.transition(with: countLable,
                          duration: 0.3,
                          options: .transitionFlipFromBottom,
                          animations: { [unowned self] in
                            self.countLable.text = String(likeString!)
                          })
        

        countLable.textColor = .red
        
                          
    }
    
    
    func animateLike() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.imageView.layer.add(animation, forKey: nil)
    }
    
   
        
    
}
