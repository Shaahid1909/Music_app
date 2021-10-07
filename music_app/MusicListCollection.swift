//
//  MusicListCollection.swift
//  music_app
//
//  Created by Shaahid on 06/10/21.
//

import UIKit

class MusicListCollection: UITableViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var songslist = [Song]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    var screenSize: CGRect!
       var screenWidth: CGFloat!
       var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSongs()
        collectionView.delegate = self
        collectionView.dataSource = self
//        screenSize = UIScreen.main.bounds
//               screenWidth = screenSize.width
//               screenHeight = screenSize.height

               // Do any additional setup after loading the view, typically from a nib
//               let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//               layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
//               layout.itemSize = CGSize(width: screenWidth / 3, height: screenWidth / 3)
//               collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//
        
    }
    
    func configureSongs() {
        songslist.append(Song(name: "Baby Be Mine",
                          albumName: "Thriller",
                          artistName: "mj",
                          imageName: "demo1",
                         trackName: "Babysong1"
       ))
        songslist.append(Song(name: "Beat It",
                          albumName: "Thriller",
                          artistName: "Michael Jackson",
                          imageName: "demo3",
                          trackName: "BeatItsong2"
        ))
        songslist.append(Song(name: "The Earth song",
                          albumName: "Thriller",
                          artistName: "mj",
                          imageName: "demo1",
                          trackName: "BeatItsong2"
        ))
        songslist.append(Song(name: "Billie Jean",
                          albumName: "Thriller",
                          artistName: "Michael Jackson",
                          imageName: "demo2",
                          trackName: "BillieJeansong3"
        ))
     
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return songslist.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "musiccollectioncell", for: indexPath) as! MusicCollCell
        let song = songslist[indexPath.row]
    
        cell.collsonglab.text = song.name
        cell.collImage.image = UIImage(named: song.imageName)
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected")
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player1") as? NewPlayerViewController else {
            return
        }
        vc.songs = songslist
        vc.position = position
        vc.modalPresentationStyle = .fullScreen
       self.navigationController?.pushViewController(vc, animated: true)
        
    }

    
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//

}
