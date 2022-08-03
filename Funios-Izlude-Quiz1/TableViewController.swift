//
//  TableViewController.swift
//  Funios-Izlude-Quiz1
//
//  Created by FauziArda on 02/08/22.
//

import UIKit

class TableViewController: UITableViewController {


    var data  = [Color ]()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.register(CustomCell.self, forCellReuseIdentifier: "cellId")
            tableView.estimatedRowHeight = UITableView.automaticDimension
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "sort/random", style: .plain, target: self, action: #selector(handleSortButton))
            
            appendData()
        }
    
        func appendData()  {
            for _ in 1...10 {
                data.append(generateRandomColor())
            }
            tableView.reloadData()
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return data.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CustomCell
            
            cell.card.backgroundColor = UIColor(data[indexPath.row])
            cell.card.setTitle(data[indexPath.row].description, for: .normal)
            
//            let tapGesture = xUITapGestureRecognizer(target: self, action: #selector(self.handleCardButton))
//                tapGesture.color = data[indexPath.row]
//
//            cell.addGestureRecognizer(tapGesture)
            
            return cell
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let destination = DetailViewController(color: data[indexPath.row])
        self.navigationController?.pushViewController(destination, animated: true)
        
    }
    
        @objc func handleCardButton(sender: UITapGestureRecognizer){
            var color : Color
            switch(sender) {
            case is xUITapGestureRecognizer:
                color = (sender as! xUITapGestureRecognizer).color
                default:
                color = .gray
                }
             self.navigationController?.pushViewController(DetailViewController(color: color), animated: true)
            }
    
        override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if indexPath.row == data.count-1 {
                appendData()
                    
            }
        }
    
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        lazy var stack : UIStackView = {
//            let st = UIStackView()
//            st.translatesAutoresizingMaskIntoConstraints = false
//            st.distribution = .fill
//            st.axis = .horizontal
//            st.alignment = .trailing
//            st.spacing  = 16
//            return st
//        }()
//
//        lazy var btnRandom : UIButton = {
//            let btn = UIButton()
//            btn.translatesAutoresizingMaskIntoConstraints = false
//            btn.setTitleColor(.black, for: .normal)
//            btn.setTitle("sort/random", for: .normal)
//            btn.sizeToFit()
//            btn.addTarget(self, action: #selector(handleSortButton), for: .touchUpInside)
//            return btn
//        }()
//
//        stack.addArrangedSubview(UIView())
//        stack.addArrangedSubview(btnRandom)
//        stack.widthAnchor.constraint(equalToConstant: tableView.frame.width - 16).isActive = true
//        stack.alignment = .trailing
//
//        return stack
//    }
    
    @objc func handleSortButton(){
        data.removeAll()
        for _ in 1...10 {
            data.append(generateRandomColor())
        }
        tableView.reloadData()
    }
    
    func generateRandomColor() -> Color {
        let number : Int = Int.random(in: 1...10)
        var color : Color
        switch number {
            case 1 : color = .red
            case 2 : color = .gray
            case 3 : color = .blue
            case 4 : color = .black
            case 5 : color = .green
            case 6 : color = .teal
            case 7 : color = .brown
            case 8 : color = .indigo
            case 9 : color = .orange
            case 10 : color = .purple
            default : color = .yellow
        }
        return color
    }
    
    
    
}

class CustomCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    lazy var card : UIButton = {
        let bt = UIButton()
        bt.layer.cornerRadius = 20
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitleColor(.white, for: .normal)
        
        return bt
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(card)
        NSLayoutConstraint.activate([
            // card
            card.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            card.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            card.heightAnchor.constraint(equalToConstant: 150),
            card.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            card.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if DEBUG
import SwiftUI
struct TableViewController_Preview : PreviewProvider {
    static var previews: some View{
        ViewControllerPreview {
            TableViewController()
        }
    }
}
#endif

class xUITapGestureRecognizer : UITapGestureRecognizer{
    var color : Color = .gray
}

