import UIKit
import AVFoundation

class MoneyLongViewController : UIViewController {
    
    var player = AVAudioPlayer()
    var isPlaying = false
    var timer: Timer?
    
    let path = Bundle.main.url(forResource: "kizaru-money-long-mp3", withExtension: "mp3")
    
    private let imageSongView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "money_long"))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameSongLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Money Long"
        return label
    }()
    
    private let artistSongLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .center
        label.text = "Kizaru"
        return label
    }()
    
    private let sliderSong: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        return slider
    }()
    
    private let buttonPlayPause: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 50, weight: .regular)
        button.setImage(UIImage(systemName: "play.fill", withConfiguration: configuration), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        view.backgroundColor = .white
        setupLayout()
        setupActions()
        do {
            if let path = Bundle.main.path(forResource: "kizaru-money-long-mp3", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                sliderSong.maximumValue = Float(player.duration)
            }
        } catch  {
            print("Error")
        }
        
    }
    
    private func setupLayout() {
        [imageSongView, nameSongLabel, artistSongLabel, sliderSong, buttonPlayPause].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            imageSongView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageSongView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            imageSongView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            imageSongView.heightAnchor.constraint(equalTo: imageSongView.widthAnchor),
            
            nameSongLabel.topAnchor.constraint(equalTo: imageSongView.bottomAnchor, constant: 30),
            nameSongLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            artistSongLabel.topAnchor.constraint(equalTo: nameSongLabel.bottomAnchor, constant: 5),
            artistSongLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            sliderSong.topAnchor.constraint(equalTo: artistSongLabel.bottomAnchor, constant: 30),
            sliderSong.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            sliderSong.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            buttonPlayPause.topAnchor.constraint(equalTo: sliderSong.bottomAnchor, constant: 10),
            buttonPlayPause.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    private func setupActions() {
        buttonPlayPause.addTarget(self, action: #selector(buttonChanged), for: .touchUpInside)
        sliderSong.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
    }
    
    @objc private func sliderChanged(sender: UISlider) {
        stopTimer()
        self.player.currentTime = TimeInterval(sender.value)
        
        if isPlaying{
            player.play()
        }
        
        startTimer()
    }
    
    @objc private func buttonChanged() {
        isPlaying.toggle()
        
        if isPlaying {
            player.play()
            startTimer()
            let configuration = UIImage.SymbolConfiguration(pointSize: 50, weight: .regular)
            buttonPlayPause.setImage(UIImage(systemName: "pause.fill", withConfiguration: configuration), for: .normal)
        } else {
            player.pause()
            stopTimer()
            let configuration = UIImage.SymbolConfiguration(pointSize: 50, weight: .regular)
            buttonPlayPause.setImage(UIImage(systemName: "play.fill", withConfiguration: configuration), for: .normal)
        }
    }
    
    private func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateSlider() {
        sliderSong.value = Float(player.currentTime)
    }
}
