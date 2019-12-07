//
//  MSResourceManagerVideoViewController.swift
//  MotoShare
//
//  Created by houhanglei on 2019/11/30.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import AVFoundation

class MSResourceManagerVideoViewController: MSResourceManagerCameraViewController,AVCaptureFileOutputRecordingDelegate {

    var movieOutput: AVCaptureMovieFileOutput!
    
    var videoPath: URL?
    
    var timeNo: Int = 0
    lazy var timer: Timer = {
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            
            self.tickDown()
        }
        return timer
    }()
    
    /// 底部拍照等view
    lazy var videoBottomToolBarView: MSVideoBottomToolBarView = {
        
        let view = MSVideoBottomToolBarView.view()
        view.delegate = self
        view.layer.zPosition = 1
        self.bottomToolBarView.addSubview(view)
        
        return view
    }()
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.timer.invalidate()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieOutput = AVCaptureMovieFileOutput.init()

        let captureConnection = self.movieOutput.connection(with: .video)
        if captureConnection?.isVideoStabilizationSupported == true {
            
            captureConnection?.preferredVideoStabilizationMode = .auto
        }

        if self.captureSession.canAddOutput(self.movieOutput) {
                        
            self.captureSession.addOutput(self.movieOutput)
        }
        
        self.videoBottomToolBarView.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
    }
    
    func tickDown(){
        
        self.timeNo = self.timeNo + 1
        self.videoBottomToolBarView.updateCurrentTimeNo(no: self.timeNo)
        
        if self.timeNo == 31 {
            
            self.movieOutput.stopRecording()
            self.timer.fireDate = Date.distantFuture
        }
    }
        
    override func hbs_viewEvent(_ view: UIView, hbs_eventObject: HBSViewEventObject) {
        super.hbs_viewEvent(view, hbs_eventObject: hbs_eventObject)
        
        if hbs_eventObject.hbs_eventType == "录像" {
            
            self.shootAction()
        
        }else if hbs_eventObject.hbs_eventType == "录制下一步" {
            
            if self.delegate != nil {
                
                if self.videoPath == nil {
                    
                    HBSProgressHUD.hbs_showError(title: "无法获取视频地址，请重试")
                    return
                }
                
                let msAsset = MSPHAsset.init()
                msAsset.mediaType = .video
                msAsset.videoPath = self.videoPath!
                
                self.delegate!.videoChoiceFinish?(asset: msAsset)
                
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func shootAction() {
        
        let captureConnection = self.movieOutput.connection(with: .video)
        if self.movieOutput.isRecording == false {
            
            captureConnection?.videoOrientation = self.previewLayer.connection!.videoOrientation
            self.movieOutput.startRecording(to: URL.init(fileURLWithPath: self.getVideoFilePath()), recordingDelegate: self)
            
            self.videoBottomToolBarView.recordingStart()
            
        }else {
            
            self.movieOutput.stopRecording()
            self.timer.fireDate = Date.distantFuture
            
            self.videoBottomToolBarView.recordingComplete(timeNo: self.timeNo - 1)
            self.timeNo = 0

        }
    }
    
//    AVCaptureFileOutputRecordingDelegate
    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        
//        开始录制
        self.timer.fire()
        self.timer.fireDate = Date.distantPast
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        
        if error != nil {
            
            HBSProgressHUD.hbs_showError(title: error?.localizedDescription)
        
        }else {
            
            self.videoPath = outputFileURL
        }
    }
    
    /// 获取视频保存路径
    func getVideoFilePath() -> String {
        
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        
        let formatter = DateFormatter.init()
        formatter.dateFormat = "yyyyMMddHHmmss"
        
        let nowTime = formatter.string(from: Date())
        
        let fileName = path?.appendingPathComponent(nowTime + ".mov")
        return fileName!
    }
}
