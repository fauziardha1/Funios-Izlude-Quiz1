//
//  ViewController.swift
//  Funios-Izlude-Quiz1
//
//  Created by FauziArda on 02/08/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    let color : Color
    
    init(color: Color) {
        self.color = color
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        view.backgroundColor = UIColor(color)
        
        setupView()
    }
    
    lazy var stack : UIStackView = {
        let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        st.distribution = .fillProportionally
        st.axis = .vertical
        st.alignment = .leading
        st.spacing = 100
        
        return st
    }()
    
    lazy var image: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "eye.fill")!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(self.color)
        return imageView
    }()
    
    lazy var descLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        label.textColor = UIColor(self.color)
        label.numberOfLines = 0
        label.text = String(repeating: "This is dummy text", count: 100)
        return label
    }()
    
    func setupView(){
        view.backgroundColor = .white
        view.addSubview(stack)
        
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(descLabel)
        stack.addArrangedSubview(UIView())
        
        stack.alignment = .center
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
//            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.heightAnchor.constraint(equalToConstant: 125),
            
        ])
        
    }

    
}



#if DEBUG
import SwiftUI
struct DetailViewController_Preview : PreviewProvider {
    static var previews: some View{
        ViewControllerPreview {
            DetailViewController(color: .blue)
        }
    }
}

struct ViewControllerPreview: UIViewControllerRepresentable {
    let viewControllerBuilder: () -> UIViewController
    
    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewControllerBuilder()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Not needed
    }
}

#endif
