import UIKit
import AVFoundation

class MoneyLongViewController : UIViewController {
    
    var songs: [String] = []
    var currentIndex: Int = 0
    
    var player = AVAudioPlayer()
    var isPlaying = false
    var timer: Timer?
    
    private let imageSongView: UIImageView = {
        let imageView = UIImageView()
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
    
    private let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.value = 0.5
        return slider
    }()
    
    private let sliderSong: UISlider = {
        let slider = UISlider()
        return slider
    }()
    
    private let currentTimeSongLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .left
        label.text = "00:00"
        return label
    }()
    
    private let durationSongLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    private let buttonPrevious: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 35, weight: .regular)
        button.setImage(UIImage(systemName: "backward.end.fill", withConfiguration: configuration), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let buttonNext: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 35, weight: .regular)
        button.setImage(UIImage(systemName: "forward.end.fill", withConfiguration: configuration), for: .normal)
        button.tintColor = .black
        return button
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissSelf))
        view.backgroundColor = .white
        setupLayout()
        setupActions()
        updateView()
        
    }
    @objc private func dismissSelf() {
        dismiss(animated: true)
        player.stop()
    }
    
    private func updateView() {
        do {
            if let path = Bundle.main.url(forResource: songs[currentIndex], withExtension: "mp3") {
            try player = AVAudioPlayer(contentsOf: path)
                sliderSong.maximumValue = Float(player.duration)
                imageSongView.image = UIImage(named: songs[currentIndex])
                nameSongLabel.text = songs[currentIndex]
                let date = Date(timeIntervalSince1970: player.duration)
                let formatter = DateFormatter()
                formatter.dateFormat = "mm:ss"
                formatter.timeZone = TimeZone(secondsFromGMT: 0)
                durationSongLabel.text = formatter.string(from: date)
            }
        } catch  {
            print("Error")
        }
    }
    
    private func setupLayout() {
        [imageSongView, nameSongLabel, artistSongLabel, sliderSong, buttonPlayPause, currentTimeSongLabel, durationSongLabel, buttonNext, buttonPrevious, volumeSlider].forEach {
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
            
            sliderSong.topAnchor.constraint(equalTo: artistSongLabel.bottomAnchor, constant: 70),
            sliderSong.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            sliderSong.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            currentTimeSongLabel.leadingAnchor.constraint(equalTo: sliderSong.leadingAnchor),
            currentTimeSongLabel.bottomAnchor.constraint(equalTo: sliderSong.topAnchor, constant: 5),
            
            durationSongLabel.trailingAnchor.constraint(equalTo: sliderSong.trailingAnchor),
            durationSongLabel.bottomAnchor.constraint(equalTo: sliderSong.topAnchor, constant: 5),
            
            buttonPrevious.trailingAnchor.constraint(equalTo: buttonPlayPause.leadingAnchor, constant: -30),
            buttonPrevious.centerYAnchor.constraint(equalTo: buttonPlayPause.centerYAnchor),
            
            buttonNext.leadingAnchor.constraint(equalTo: buttonPlayPause.trailingAnchor, constant: 30),
            buttonNext.centerYAnchor.constraint(equalTo: buttonPlayPause.centerYAnchor),
            
            buttonPlayPause.topAnchor.constraint(equalTo: sliderSong.bottomAnchor, constant: 10),
            buttonPlayPause.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            volumeSlider.topAnchor.constraint(greaterThanOrEqualTo: buttonPlayPause.bottomAnchor, constant: 20),
            volumeSlider.leadingAnchor.constraint(equalTo: buttonPrevious.leadingAnchor),
            volumeSlider.trailingAnchor.constraint(equalTo: buttonNext.trailingAnchor)
        ])
    }
    
    private func setupActions() {
        buttonPlayPause.addTarget(self, action: #selector(buttonChanged), for: .touchUpInside)
        buttonNext.addTarget(self, action: #selector(updateCurrentIndex), for: .touchUpInside)
        buttonPrevious.addTarget(self, action: #selector(updateCurrentIndex), for: .touchUpInside)
        sliderSong.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        volumeSlider.addTarget(self, action: #selector(changeValume), for: .valueChanged)
    }
    
    @objc private func changeValume() {
        player.volume = volumeSlider.value
    }
    
    @objc private func updateCurrentIndex(_ sender: UIButton) {
        if sender == buttonNext {
            if (currentIndex + 1) < songs.count {
                currentIndex += 1
            } else {
                currentIndex = 0
            }
            
            updateView()
            
            if isPlaying {
                player.play()
                startTimer()
            }
        } else if sender == buttonPrevious {
            if player.currentTime > 3 {
                stopTimer()
                player.currentTime = 0
                player.play()
                startTimer()
            } else {
                if currentIndex > 0 {
                    currentIndex -= 1
                } else {
                    currentIndex = songs.count - 1
                }
                updateView()
                if isPlaying {
                    player.play()
                    startTimer()
                }
            }
        }
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
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateSlider() {
        let date = Date(timeIntervalSince1970: player.currentTime)
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        let duration = player.duration - player.currentTime
        
        let durationInput = Date(timeIntervalSince1970: duration)
        
        durationSongLabel.text = "-" + formatter.string(from: durationInput)
        
        currentTimeSongLabel.text = formatter.string(from: date)
        sliderSong.value = Float(player.currentTime)
    }
}
