//
//  BirthdayViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 24.09.2022.
//

import UIKit

/// Список дней рождений 
class BirthdayViewController: UIViewController {
    
    var jeremyView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.frame = CGRect(x: 0, y: 120, width: 410, height: 80)
        
        var userPhotoImageView: UIImageView = {
            let imageView = UIImageView()
            
            imageView.frame = CGRect(x: 5, y: 10, width: 70, height: 70)
            imageView.image = UIImage(systemName: "person.crop.circle.fill")
            imageView.tintColor = .gray
            return imageView
        }()
        
        var nameLabel: UILabel = {
            let label = UILabel()
            
            label.frame = CGRect(x: 75, y: 0, width: 120, height: 50)
            label.textAlignment = .left
            label.font = UIFont(name: "Helvetica-Bold", size: 23)
            label.textColor = .black
            
            label.text = "Jeremy"
            return label
        }()
        
        var daysBeforeBirthLabel: UILabel = {
            let label = UILabel()
            
            label.frame = CGRect(x: 325, y: 0, width: 100, height: 50)
            label.font = UIFont(name: "Helvetica", size: 21)
            label.textColor = .gray
            
            label.text = "18 дней"
            return label
            
        }()
        
        var birthdayInfoLabel: UILabel = {
            let label = UILabel()
            
            label.frame = CGRect(x: 75, y: 35, width: 300, height: 50)
            label.font = UIFont(name: "Helvetica", size: 15)
            label.textColor = .gray
            
            label.text = "10 марта, в среду исполнится 25 лет "
            return label
        }()
        
        view.addSubview(userPhotoImageView)
        view.addSubview(nameLabel)
        view.addSubview(daysBeforeBirthLabel)
        view.addSubview(birthdayInfoLabel)
        view.addBottomBorderView()
        return view
    }()
    
    var mariaView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 210, width: 400, height: 80)
        
        var userPhotoImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 5, y: 10, width: 70, height: 70)
            imageView.image = UIImage(systemName: "person.crop.circle.fill")
            imageView.tintColor = .gray
            return imageView
        }()
        
        var nameLabel: UILabel = {
            let label = UILabel()
            
            label.frame = CGRect(x: 75, y: 0, width: 120, height: 50)
            label.textAlignment = .left
            label.font = UIFont(name: "Helvetica-Bold", size: 23)
            label.textColor = .black
            
            label.text = "Maria Lui"
            return label
        }()
        
        var daysBeforeBirthLabel: UILabel = {
            let label = UILabel()
            
            label.frame = CGRect(x: 325, y: 0, width: 100, height: 50)
            label.font = UIFont(name: "Helvetica", size: 21)
            label.textColor = .gray
            
            label.text = "28 дней"
            return label
        }()
        
        var birthdayInfoLabel: UILabel = {
            let label = UILabel()
            
            label.frame = CGRect(x: 75, y: 35, width: 300, height: 50)
            label.font = UIFont(name: "Helvetica", size: 15)
            label.textColor = .gray
            
            label.text = "30 марта, в четверг исполнится 20 лет "
            return label
        }()
        
        view.addSubview(userPhotoImageView)
        view.addSubview(nameLabel)
        view.addSubview(daysBeforeBirthLabel)
        view.addSubview(birthdayInfoLabel)
        view.addBottomBorderView()
        return view
    }()
    
    var jonyView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 300, width: 400, height: 80)
        
        var userPhotoImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 5, y: 10, width: 70, height: 70)
            imageView.image = UIImage(systemName: "person.crop.circle.fill")
            imageView.tintColor = .gray
            return imageView
        }()
        
        var nameLabel: UILabel = {
            let label = UILabel()
            
            label.frame = CGRect(x: 75, y: 0, width: 120, height: 50)
            label.textAlignment = .left
            label.font = UIFont(name: "Helvetica-Bold", size: 23)
            label.textColor = .black
            
            label.text = "Jony Stark"
            return label
        }()
        
        var daysBeforeBirthLabel: UILabel = {
            let label = UILabel()
            
            label.frame = CGRect(x: 325, y: 0, width: 100, height: 50)
            label.font = UIFont(name: "Helvetica", size: 21)
            label.textColor = .gray
            
            label.text = "53 дней"
            return label
        }()
        
        var birthdayInfoLabel: UILabel = {
            let label = UILabel()
            
            label.frame = CGRect(x: 75, y: 35, width: 300, height: 50)
            label.font = UIFont(name: "Helvetica", size: 15)
            label.textColor = .gray
            
            label.text = "20 апреля, в субботу исполнится 25 лет "
            return label
        }()
        
        view.addSubview(userPhotoImageView)
        view.addSubview(nameLabel)
        view.addSubview(daysBeforeBirthLabel)
        view.addSubview(birthdayInfoLabel)
        view.addBottomBorderView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
    }
    
    func addSubview() {
        title = "Birthday"
        view.backgroundColor = .white
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(newUserAction))
        view.addSubview(navigationBar)
        view.addSubview(jeremyView)
        view.addSubview(mariaView)
        view.addSubview(jonyView)
    }
    
    @objc func newUserAction(sender: UIButton!) {
        let userDataViewController = UserDataViewController()
        // xself.navigationController?.modalPresentationStyle = .pageSheet
        self.navigationController?.present(userDataViewController, animated: true)
    }
}
extension UIView {
    func addBottomBorderView() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        layer.addSublayer(bottomLine)
    }
}
