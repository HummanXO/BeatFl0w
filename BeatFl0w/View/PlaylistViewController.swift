import UIKit

class PlaylistViewController: UIViewController {
    
    private let firstButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        return button
    }()
    
    private let firstImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "money_long")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let firstSong: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Money Long"
        label.textAlignment = .left
        return label
    }()
    
    private let firstArtist: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Kizaru"
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .left
        return label
    }()
    
    private let firstTiming: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "02:29"
        label.textAlignment = .right
        return label
    }()
    
    private let firstSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private let secondButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        return button
    }()
    
    private let secondImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Deja_vu")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let secondSong: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Дежавю (Deja vu)"
        label.textAlignment = .left
        return label
    }()
    
    private let secondArtist: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Kizaru"
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .left
        return label
    }()
    
    private let secondTiming: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "02:54"
        label.textAlignment = .right
        return label
    }()
    
    private let secondSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "Playlist"
        setupButtonsLayout()
        setupFirstButtonLayout()
        setupSecondButtonLayout()
        setupActions()
        super.viewDidLoad()
    }
    
    private func setupButtonsLayout() {
        [firstButton, secondButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            firstButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstButton.heightAnchor.constraint(equalToConstant: 70),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor),
            secondButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondButton.heightAnchor.constraint(equalToConstant: 70),
            ])
    }
    
    private func setupFirstButtonLayout() {
        [firstImage, firstSong, firstArtist, firstTiming, firstSeparator, secondImage, secondSong, secondArtist, secondTiming, secondSeparator].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            firstButton.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            firstImage.topAnchor.constraint(equalTo: firstButton.topAnchor, constant: 10),
            firstImage.bottomAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: -10),
            firstImage.leadingAnchor.constraint(equalTo: firstButton.leadingAnchor, constant: 25),
            firstImage.widthAnchor.constraint(equalToConstant: 50),
            firstImage.heightAnchor.constraint(equalToConstant: 50),
            
            firstSong.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 20),
            firstSong.topAnchor.constraint(equalTo: firstImage.topAnchor, constant: 5),
            
            firstArtist.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 20),
            firstArtist.bottomAnchor.constraint(equalTo: firstImage.bottomAnchor, constant: -5),
            
            firstTiming.trailingAnchor.constraint(equalTo: firstButton.trailingAnchor, constant: -25),
            firstTiming.centerYAnchor.constraint(equalTo: firstImage.centerYAnchor),
            
            firstSeparator.heightAnchor.constraint(equalToConstant: 1),
            firstSeparator.leadingAnchor.constraint(equalTo: firstButton.leadingAnchor, constant: 10),
            firstSeparator.trailingAnchor.constraint(equalTo: firstButton.trailingAnchor, constant: -10),
            firstSeparator.bottomAnchor.constraint(equalTo: firstButton.bottomAnchor),
            
        ])
    }
    
    private func setupSecondButtonLayout() {
        [secondImage, secondSong, secondArtist, secondTiming, secondSeparator].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            secondButton.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            secondImage.topAnchor.constraint(equalTo: secondButton.topAnchor, constant: 10),
            secondImage.bottomAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: -10),
            secondImage.leadingAnchor.constraint(equalTo: secondButton.leadingAnchor, constant: 25),
            secondImage.widthAnchor.constraint(equalToConstant: 50),
            secondImage.heightAnchor.constraint(equalToConstant: 50),
            
            secondSong.leadingAnchor.constraint(equalTo: secondImage.trailingAnchor, constant: 20),
            secondSong.topAnchor.constraint(equalTo: secondImage.topAnchor, constant: 5),
            
            secondArtist.leadingAnchor.constraint(equalTo: secondImage.trailingAnchor, constant: 20),
            secondArtist.bottomAnchor.constraint(equalTo: secondImage.bottomAnchor, constant: -5),
            
            secondTiming.trailingAnchor.constraint(equalTo: secondButton.trailingAnchor, constant: -25),
            secondTiming.centerYAnchor.constraint(equalTo: secondImage.centerYAnchor),
            
            secondSeparator.heightAnchor.constraint(equalToConstant: 1),
            secondSeparator.leadingAnchor.constraint(equalTo: secondButton.leadingAnchor, constant: 10),
            secondSeparator.trailingAnchor.constraint(equalTo: secondButton.trailingAnchor, constant: -10),
            secondSeparator.bottomAnchor.constraint(equalTo: secondButton.bottomAnchor),
            
        ])
    }
    
    private func setupActions() {
        firstButton.addTarget(self, action: #selector(highlited(_ :)), for: .touchDown)
        firstButton.addTarget(self, action: #selector(unhighlited(_ :)), for: [.touchDragExit, .touchDragInside, .touchUpInside])
        firstButton.addTarget(self, action: #selector(showFirstSong), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(highlited(_ :)), for: .touchDown)
        secondButton.addTarget(self, action: #selector(unhighlited(_ :)), for: [.touchDragExit, .touchDragInside, .touchUpInside])
    }
    
    @objc private func showFirstSong() {
        let moneyLongViewController = MoneyLongViewController()
        let navController = UINavigationController(rootViewController: moneyLongViewController)
        present(navController, animated: true)
    }
    
    @objc private func highlited(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.backgroundColor = .systemGray6
            if sender == self.firstButton {
                self.firstSeparator.isHidden = true
            } else if sender == self.secondButton {
                self.secondSeparator.isHidden = true
            }
        }
    }
    
    @objc private func unhighlited(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.backgroundColor = .white
            if sender == self.firstButton {
                self.firstSeparator.isHidden = false
            } else if sender == self.secondButton {
                self.secondSeparator.isHidden = false
            }
        }
    }
}
