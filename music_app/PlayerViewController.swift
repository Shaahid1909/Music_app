
import AVFoundation
import UIKit
var isMix = false

class PlayerViewController: UIViewController,AVAudioPlayerDelegate  {

    public var position: Int = 0
    public var songs: [Song] = []

    @IBOutlet var songNameLabel: UILabel!
    
    @IBOutlet var artistNameLabel: UILabel!
    
    @IBOutlet var albumNameLabel: UILabel!
    
    var player: AVAudioPlayer?

    
    
    @IBOutlet weak var artistImage: UIImageView!
    
    @IBOutlet var playButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
   
    

    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var totalTime: UILabel!
    
           
       
    @IBOutlet var slide: UISlider!
   
 
    
  //  let playPauseButton = UIButton()
    
    @objc func _slider () {
        if player!.isPlaying {
            player?.stop()
            player?.currentTime =  TimeInterval(slide.value)
           player?.play()
         //   playButton.setImage(UIImage(named: "play"), for: .normal)
        }else{
            player?.currentTime = TimeInterval(slide.value)
    
        }
        
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer!, successfully flag: Bool) {
        print("finished audio")
   
           playButton.setImage(UIImage(named: "play"), for: .normal)
           if position <= (songs.count) {
           position = position + 1
           player?.stop()
           configure()
     }
    }
    
    
    @IBOutlet var mixed: UIButton!
  
    
    @objc func _mix ()
      {
       if isMix{
           isMix = false
        mixed.setImage(UIImage(named: "shuffle.png"), for: .normal)
        let alert = UIAlertController(title: "", message: "Shuffle is OFF", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
        alert.dismiss(animated: true, completion: nil)
        }
       }
       else{
           isMix = true
        mixed.setImage(UIImage(named: "shuffle_s.png"), for: .normal)
        let alert = UIAlertController(title: "", message: "Shuffle is ON", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
          alert.dismiss(animated: true, completion: nil)
        }}
       }
    
    @objc func _back ()
       {
//           if isMix {
//               if rondomInt < songList.count - 1 {
//                   rondomInt -= 1
//                   if rondomInt < 0  {
//                       rondomInt = 0
//                       return
//                   }
//                   activeSong = rondomInt
//                   playThisSong(activeSong: songList[rondomInt])
//                   time.text = ""
//                   totalTime.text = ""
//                   updateTime()
//                   getArtistInfo()
//                   audioPlayer.play()
//                   playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }
//               else{
//                   rondomInt = 0
//                   activeSong = 0
//                   playThisSong(activeSong: songList[activeSong])
//                   time.text = ""
//                   totalTime.text = ""
//                    updateTime()
//                    getArtistInfo()
//                     audioPlayer.play()
//                   playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }
//           }else{
//
//               if activeSong < songList.count - 1 {
//                   activeSong -= 1
//                   if activeSong < 0 {
//                       activeSong = 0
//                       return
//                   }
//                   playThisSong(activeSong: songList[activeSong])
//                   time.text = ""
//                    totalTime.text = ""
//                  updateTime()
//                  getArtistInfo()
//                  audioPlayer.play()
//                   playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }
//               else {
//                   activeSong = 0
//                   playThisSong(activeSong: songList[activeSong])
//                   time.text = ""
//                   totalTime.text = ""
//                    updateTime()
//                   getArtistInfo()
//                  audioPlayer.play()
//                 playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }
//
//          }
//
       }
       @objc func _next ()
       {
//           if isMix {
//               if rondomInt < songList.count - 1 {
//                   rondomInt += 1
//                   activeSong = rondomInt
//                      playThisSong(activeSong: songList[activeSong])
//                               time.text = ""
//                               totalTime.text = ""
//                                updateTime()
//                               getArtistInfo()
//                              audioPlayer.play()
//                             playBtn.setImage(UIImage(named: "pause"), for: .normal)
//
//               }else{
//                   rondomInt = 0
//                   activeSong = 0
//                   playThisSong(activeSong: songList[activeSong])
//                                   time.text = ""
//                                   totalTime.text = ""
//                                    updateTime()
//                                   getArtistInfo()
//                                  audioPlayer.play()
//                                 playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }
//
//           }else{
//               if activeSong < songList.count - 1 {
//                   activeSong += 1
        
//                   if activeSong > songList.count {
//                       activeSong = 0
//                       return
//                   }
//                   playThisSong(activeSong: songList[activeSong])
//                    time.text = ""
//                   totalTime.text = ""
//                    updateTime()
//                    getArtistInfo()
//                   getCoverImage()
//                     audioPlayer.play()
//                 playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }else{
//                   activeSong = 0
//                   playThisSong(activeSong: songList[activeSong])
//                                                             time.text = ""
//                                                             totalTime.text = ""
//                                                              updateTime()
//                                                             getArtistInfo()
//                                                            audioPlayer.play()
//                                                           playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }
//           }
           
        }
    
    @objc func update (_timer : Timer ) {
        slide.value = Float(player!.currentTime)
        
           time.text =  stringFormatterTimeInterval(interval: TimeInterval(slide.value)) as String
       }
    
    func updateTime() {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        slide.maximumValue = Float(player!.duration)
        totalTime.text = stringFormatterTimeInterval(interval: player!.duration) as String
    }
    func stringFormatterTimeInterval(interval : TimeInterval) ->NSString {
        let ti = NSInteger(interval)
        let second = ti % 60
        let minutes = ( ti / 60) % 60
        return NSString(format: "%0.2d:%0.2d", minutes,second)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
      
//
//        totalTime.text = "-:--"
//        totalTime.font = UIFont.systemFont(ofSize : 12)
//        totalTime.textColor = .black
//
//
//        time.text = "-:--"
//        time.font = UIFont.systemFont(ofSize : 12)
//        time.textColor = .black
//
        artistImage.clipsToBounds = true
        artistImage.layer.cornerRadius = 10
        artistImage.contentMode = .scaleAspectFill
        
        slide.maximumValue = 1000
        slide.minimumValue = 0
        slide.tintColor = UIColor.black
        slide.addTarget(self, action: #selector(_slider), for: .touchDragInside)
          
        
     //     playButton.setImage(UIImage(named: "play"), for: .normal)
          playButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        
        backButton.setImage(UIImage(named: "previous"), for: .normal)
 

    //    mixed.setImage(UIImage(named: "mix"), for: .normal)
        mixed.addTarget(self, action: #selector(_mix), for: .touchUpInside)
        
        nextButton.setImage(UIImage(named: "next"), for: .normal)

        view.addSubview(artistImage)
        let song = songs[position]

                let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")

                do {
    
                    try AVAudioSession.sharedInstance().setMode(.default)
                    try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

                    guard let urlString = urlString else {
                        print("urlstring is nil")
                        return
                    }

                    player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

                    player?.delegate = self
                    
                    guard let player = player else {
                        print("player is nil")
                        return
                    }
                    player.volume = 0.5

                    player.play()
                }
                catch {
                    print("error occurred")
                }

        artistImage.image = UIImage(named: song.imageName)
        songNameLabel.text = song.name
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)

    }

    func configure() {
        // set up player
        let song = songs[position]

        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")

        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            guard let urlString = urlString else {
                print("urlstring is nil")
                return
            }

            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            guard let player = player else {
                print("player is nil")
                return
            }
            player.volume = 0.5

            player.play()
        }
        catch {
            print("error occurred")
        }

      artistImage.image = UIImage(named: song.imageName)


      songNameLabel.text = song.name
      albumNameLabel.text = song.albumName
      artistNameLabel.text = song.artistName

        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)

    playButton.setImage(UIImage(named: "pause"), for: .normal)

    }

    @objc func didTapBackButton() {
        if position > 0 {
            position = position - 1
            player?.stop()
            configure()
        }
    }
    @IBOutlet var holder: UIView!
    
    @objc func didTapNextButton() {
        if position < (songs.count - 1) {
            position = position + 1
            player?.stop()
            configure()
        }
    }

    @objc func didTapPlayPauseButton() {
        if player!.isPlaying == true {
            player?.pause()
            playButton.setImage(UIImage(named: "play"), for: .normal)
            updateTime()
        }else{
            player?.play()
            playButton.setImage(UIImage(named: "pause"), for: .normal)
            updateTime()

        }
    }

    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if player!.isPlaying {
              // getArtistInfo()
               updateTime()
               playButton.setImage(UIImage(named: "pause"), for: .normal)
           }
       }

}
extension UIView{
    func anchor(top : NSLayoutYAxisAnchor?
                ,left : NSLayoutXAxisAnchor?,
                 bottom : NSLayoutYAxisAnchor? ,
                 rigth: NSLayoutXAxisAnchor?,
                 marginTop : CGFloat ,
                 marginLeft : CGFloat ,
                marginBottom: CGFloat
                ,marginRigth : CGFloat ,
                 width : CGFloat ,
                 heigth : CGFloat
    
    )  {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: marginTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: marginLeft).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -marginBottom).isActive = true
        }
        if let rigth = rigth {
            self.rightAnchor.constraint(equalTo: rigth, constant: -marginRigth).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if heigth != 0{
            heightAnchor.constraint(equalToConstant: heigth).isActive = true
        }
    }
    
    

}


